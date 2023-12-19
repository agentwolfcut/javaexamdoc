package sit.int202.classicmodels.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.classicmodels.checkempty.OfficeTools;
import sit.int202.classicmodels.checkempty.StringCheck;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.repositories.OfficeRepository;
import sit.int202.classicmodels.checkempty.StringCheck;

import java.io.IOException;

@WebServlet(name = "OfficeActionServlet", value = "/office-action")
public class OfficeActionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String officeCode = req.getParameter("officeCode");
        OfficeRepository officeRepository = new OfficeRepository();

        if (StringCheck.isBlank(action)) {
            forwardToOfficeForm(req, resp, "insert");
        } else {
            Office office = (StringCheck.isBlank(officeCode)) ? null : officeRepository.find(officeCode);
            if (office == null) {
                resp.sendRedirect(req.getContextPath() + "/office-list");
            } else {
                req.setAttribute("office", office);
                forwardToOfficeForm(req, resp, "update");
            }
        }
    }

    private void forwardToOfficeForm(HttpServletRequest req, HttpServletResponse resp, String action)
            throws ServletException, IOException {
        req.setAttribute("action", action);
        req.getServletContext().getRequestDispatcher("/office-form.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();

        String action = req.getParameter("action");


        if (action.equalsIgnoreCase("delete")) {
            String officeCode = req.getParameter("officeCode");
            Office office = officeRepository.find(officeCode);
            if (office == null) return;
            officeRepository.delete(office);
            resp.sendRedirect(req.getContextPath() + "/office-list");
            return;
        }

        if (action.equalsIgnoreCase("insert")) {

            Office office = OfficeTools.createOffice(req,resp);
            officeRepository.insert(office);
            resp.sendRedirect(req.getContextPath() + "/office-list");
            return;
        }

        if (action.equalsIgnoreCase("update")) {
            Office office = officeRepository.find(req.getParameter("officeCode"));
            if (office == null) {
                resp.sendRedirect(req.getContextPath() + "/office-list");
                return;
            }

            String addressLine2 = req.getParameter("addressLine2");
            String state = req.getParameter("state");

            office.setOfficeCode(req.getParameter("officeCode"));
            office.setCity(req.getParameter("city"));
            office.setPhone(req.getParameter("phone"));
            office.setAddressLine1(req.getParameter("addressLine1"));
            office.setAddressLine2(StringCheck.isBlank(addressLine2)?null:addressLine2);
            office.setState(StringCheck.isBlank(state)?null:state);
            office.setCountry(req.getParameter("country"));
            office.setPostalCode(req.getParameter("postalCode"));
            office.setTerritory(req.getParameter("territory"));

            officeRepository.update(office);
            resp.sendRedirect(req.getContextPath() + "/office-list");
            return;
        }
    }
}
package sit.int202.classicmodels.checkempty;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.classicmodels.entities.Office;

public class OfficeTools {
    public static Office createOffice(HttpServletRequest req, HttpServletResponse resp){
        String officeCode = req.getParameter("officeCode");
        String city = req.getParameter("city");
        String phone = req.getParameter("phone");
        String addressLine1 = req.getParameter("addressLine1");
        String addressLine2 = req.getParameter("addressLine2");
        String state = req.getParameter("state");
        String country = req.getParameter("country");
        String postalCode = req.getParameter("postalCode");
        String territory = req.getParameter("territory");

        Office office = new Office();
        office.setOfficeCode(officeCode);
        office.setCity(city);
        office.setPhone(phone);
        office.setAddressLine1(addressLine1);
        office.setAddressLine2(StringCheck.isBlank(addressLine2)?null:addressLine2);
        office.setState(StringCheck.isBlank(state)?null:state);
        office.setCountry(country);
        office.setPostalCode(postalCode);
        office.setTerritory(territory);

        return office;
    }

}

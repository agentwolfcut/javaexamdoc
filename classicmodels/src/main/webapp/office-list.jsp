<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classic Model Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">


    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            color: #495057;
        }

        .header {
            background-color: #00FFFF;
            color: #fff;
            padding: 10px 20px;
            text-align: center;
            border-radius: 0 0 10px 10px;
            margin-bottom: 10px;
        }

        .search-form {
            margin-bottom: 20px;
            text-align: center;
        }

        .card-link {
            text-decoration: none;
            color: #212529;
        }

        .card-link:hover {
            text-decoration: none;
            color: #0d6efd;
        }

        .office-card {
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 15px;
            background-color: #fff;
            transition: transform 0.3s;
        }

        .office-card.selected {
            background-color: #87CEFA;
            transform: scale(1.05);
        }

        .office-card .action-btn {
            margin-right: 5px;
        }

        .office-details {
            font-weight: bold;
            font-size: 1.2em;
            margin-bottom: 10px;
        }
    </style>
</head>

<body class="container">
<div class="header">
    <h2>Classic Model Offices</h2>
</div>

<div class="container">
    <form class="input-group search-form" action="office-list" method="get">
        <input type="text" class="form-control" name="cityOrCountry" placeholder="Search">
        <button class="btn btn-primary" type="submit">Search</button>
    </form>

    <div class="row">
        <c:forEach items="${offices}" var="office">
            <div class="col-md-4">
                <div class="office-card ${office.officeCode == selectedOffice.officeCode ? 'selected' : ''}">
                    <div class="office-details">${office.city}, ${office.country}</div>
                    <div>${office.phone}</div>
                    <div class="mt-3">
                        <form action="office-action" method="get" class="d-inline">
                            <input type="hidden" name="action" value="update" />
                            <input type="hidden" name="officeCode" value="${office.officeCode}" />
                            <button type="submit" class="btn btn-warning action-btn">
                                <i class="bi bi-pencil-square"></i> Edit
                            </button>
                        </form>

                        <form action="office-action" method="post" class="d-inline">
                            <input type="hidden" name="action" value="delete" />
                            <input type="hidden" name="officeCode" value="${office.officeCode}" />
                            <button type="submit" class="btn btn-danger action-btn">
                                <i class="bi bi-trash-fill"></i> Delete
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <form class="input-group search-form" action="office-action" method="get">
        <button type="submit" class="btn btn-dark btn-lg">
            Add Office
        </button>
    </form>
</div>
</body>
</html>

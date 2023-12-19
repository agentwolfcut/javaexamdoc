<!DOCTYPE html>
<html>
<head>
    <title>Classic Model Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }

        .header-bg {
            background-color: #0DFEFB;
            padding: 20px;
            margin-bottom: 20px;
        }

        .header-text {
            color: white;
        }

        .form-label {
            color: #000000;
            font-weight: bold;
        }

        .form-control-label {
            color: #000000;
            font-weight: bold;
        }

        .container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
        }

        .btn-primary {
            background-color: #0DFEFB;
            border-color: #0DFEFB;
        }

        .btn-primary:hover {
            background-color: #0AE1F9;
            border-color: #0AE1F9;
        }
    </style>

</head>
<body>
    <div class="container">
        <div class="row header-bg text-center">
            <h2 class="header-text">Classic Model Online</h2>
        </div>

        <div class="row mt-3">
            <form action="office-action" method="post" class="row g-3">
                <input type="hidden" name="action" value="${requestScope.action == 'insert' ? 'insert' : 'update'}">

                <div class="col-md-6">
                    <label for="officeCode" class="form-label">Office Code</label>
                    <input type="text" class="form-control" id="officeCode" name="officeCode" required value="${requestScope.office.officeCode}" ${requestScope.action == 'insert' ? '' : 'readonly'}>
                </div>

                <div class="col-md-6">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" name="city" required value="${requestScope.office.city}">
                </div>

                <div class="col-md-6">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" required value="${requestScope.office.phone}">
                </div>

                <div class="col-md-6">
                    <label for="addressLine1" class="form-label">Address Line 1</label>
                    <input type="text" class="form-control" id="addressLine1" name="addressLine1" required value="${requestScope.office.addressLine1}">
                </div>

                <div class="col-md-6">
                    <label for="addressLine2" class="form-label">Address Line 2</label>
                    <input type="text" class="form-control" id="addressLine2" name="addressLine2" value="${requestScope.office.addressLine2}">
                </div>

                <div class="col-md-6">
                    <label for="state" class="form-label">State</label>
                    <input type="text" class="form-control" id="state" name="state" value="${requestScope.office.state}">
                </div>

                <div class="col-md-6">
                    <label for="country" class="form-label">Country</label>
                    <input type="text" class="form-control" id="country" name="country" required value="${requestScope.office.country}">
                </div>

                <div class="col-md-6">
                    <label for="postalCode" class="form-label">Postal Code</label>
                    <input type="text" class="form-control" id="postalCode" name="postalCode" required value="${requestScope.office.postalCode}">
                </div>

                <div class="col-md-6">
                    <label for="territory" class="form-label">Territory</label>
                    <input type="text" class="form-control" id="territory" name="territory" required value="${requestScope.office.territory}">
                </div>

                <div class="col-12 mt-3">
                    <input type="hidden" name="action" value="${requestScope.action}" >
                    <button type="submit" class="btn btn-success">
                        ${requestScope.action == 'insert' ? 'Insert' : 'Update'}
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

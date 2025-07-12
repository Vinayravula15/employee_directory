<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Directory</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <header>
        <h1>Employee Directory</h1>
        <input type="text" id="search-input" placeholder="Search employees...">
        <a href="add-edit-form.html"><button>Add Employee</button></a>
    </header>

    <main id="employee-list-container">
        <list employees as employee>
            <div class="employee-card" data-employee-id="${employee.id}">
                <h3>${employee.firstName} ${employee.lastName}</h3>
                <p>ID: ${employee.id}</p>
                <p>Email: ${employee.email}</p>
                <p>Department: ${employee.department}</p>
                <p>Role: ${employee.role}</p>
                <button class="edit-btn" data-id="${employee.id}" onclick=editEmployee(employee.id)>Edit</button>
                <button class="delete-btn" data-id="${employee.id}" onclick=deleteEmployee(employee.id)>Delete</button>
            </div>
        </list>
    </main>

    <script src="/static/js/data.js"></script>
    <script src="/static/js/app.js"></script>
</body>
</html>

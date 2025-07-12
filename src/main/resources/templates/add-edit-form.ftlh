<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add/Edit Employee</title>
  <link rel="stylesheet" href="../static/css/style.css" />
</head>
<body>
  <header>
    <h1>Add / Edit Employee</h1>
    <a href="dashboard.html"><button>Back to Dashboard</button></a>
  </header>

  <main style="padding: 1rem;">
    <form id="employee-form">
      <input type="hidden" id="employee-id" />

      <label>First Name:</label>
      <input type="text" id="first-name" required /><br/>
      <label>Last Name:</label>
      <input type="text" id="last-name" required /><br/>

      <label>Email:</label>
      <input type="email" id="email" required /><br/>

      <label>Department:</label>
      <input type="text" id="department" required /><br/>

      <label>Role:</label>
      <input type="text" id="role" required /><br/>

      <button type="submit">Save</button>
    </form>
  </main>

  <script src="../static/js/data.js"></script>
  <script>
    const urlParams = new URLSearchParams(window.location.search);
    const editId = urlParams.get('editId');

    if (editId) {
      const employee = mockEmployees.find(e => e.id == editId);
      if (employee) {
        document.getElementById('employee-id').value = employee.id;
        document.getElementById('first-name').value = employee.firstName;
        document.getElementById('last-name').value = employee.lastName;
        document.getElementById('email').value = employee.email;
        document.getElementById('department').value = employee.department;
        document.getElementById('role').value = employee.role;
      }
    }

    document.getElementById('employee-form').addEventListener('submit', function (e) {
      e.preventDefault();

      const id = document.getElementById('employee-id').value;
      const newEmployee = {
        id: id ? parseInt(id) : Date.now(),
        firstName: document.getElementById('first-name').value,
        lastName: document.getElementById('last-name').value,
        email: document.getElementById('email').value,
        department: document.getElementById('department').value,
        role: document.getElementById('role').value,
      };

      if (id) {
        const index = mockEmployees.findIndex(e => e.id == id);
        if (index > -1) {
          mockEmployees[index] = newEmployee;
        }
      } else {
        mockEmployees.push(newEmployee);
      }

      alert('Employee saved successfully!');
      window.location.href = 'dashboard.ftlh';
    });
  </script>
</body>
</html>

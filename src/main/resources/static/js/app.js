document.addEventListener('DOMContentLoaded', () => {
    renderEmployees(mockEmployees);

    document.getElementById('employee-form').addEventListener('submit', saveEmployee);

    document.getElementById('search-input').addEventListener('input', (e) => {
        const keyword = e.target.value.toLowerCase();
        const filtered = mockEmployees.filter(emp =>
            emp.firstName.toLowerCase().includes(keyword) ||
            emp.lastName.toLowerCase().includes(keyword) ||
            emp.email.toLowerCase().includes(keyword)
        );
        renderEmployees(filtered);
    });
});

function renderEmployees(employees) {
    const container = document.getElementById('employee-list-container');
    container.innerHTML = '';

    employees.forEach(emp => {
        const div = document.createElement('div');
        div.className = 'employee-card';
        div.setAttribute('data-id', emp.id);
        div.innerHTML = `
            <h3>${emp.firstName} ${emp.lastName}</h3>
            <p>Email: ${emp.email}</p>
            <p>Department: ${emp.department}</p>
            <p>Role: ${emp.role}</p>
            <button onclick="editEmployee(${emp.id})">Edit</button>
            <button onclick="deleteEmployee(${emp.id})">Delete</button>
        `;
        container.appendChild(div);
    });
}

function showAddForm() {
    document.getElementById('form-title').textContent = 'Add Employee';
    document.getElementById('employee-form').reset();
    document.getElementById('employee-id').value = '';
    document.getElementById('form-container').classList.remove('hidden');
}

function editEmployee(id) {
    const emp = mockEmployees.find(e => e.id === id);
    if (!emp) return;

    document.getElementById('form-title').textContent = 'Edit Employee';
    document.getElementById('employee-id').value = emp.id;
    document.getElementById('first-name').value = emp.firstName;
    document.getElementById('last-name').value = emp.lastName;
    document.getElementById('email').value = emp.email;
    document.getElementById('department').value = emp.department;
    document.getElementById('role').value = emp.role;

    document.getElementById('form-container').classList.remove('hidden');
}

function deleteEmployee(id) {
    if (!confirm('Are you sure you want to delete this employee?')) return;
    mockEmployees = mockEmployees.filter(emp => emp.id !== id);
    renderEmployees(mockEmployees);
}

function saveEmployee(e) {
    e.preventDefault();
    const id = document.getElementById('employee-id').value;
    const firstName = document.getElementById('first-name').value.trim();
    const lastName = document.getElementById('last-name').value.trim();
    const email = document.getElementById('email').value.trim();
    const department = document.getElementById('department').value.trim();
    const role = document.getElementById('role').value.trim();

    if (!firstName || !lastName || !email || !department || !role) {
        alert('All fields are required.');
        return;
    }

    if (!/^\S+@\S+\.\S+$/.test(email)) {
        alert('Invalid email format.');
        return;
    }

    if (id) {
        const emp = mockEmployees.find(emp => emp.id === parseInt(id));
        Object.assign(emp, { firstName, lastName, email, department, role });
    } else {
        mockEmployees.push({
            id: Date.now(),
            firstName, lastName, email, department, role
        });
    }

    renderEmployees(mockEmployees);
    cancelForm();
}

function cancelForm() {
    document.getElementById('form-container').classList.add('hidden');
}

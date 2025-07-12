# 🧑‍💼 Employee Directory Web App

This is a simple Employee Directory web application built using **Spring Boot**, **Freemarker templates**, HTML, CSS, and JavaScript. It allows users to **view**, **add**, **edit**, and **delete** employees via a user-friendly interface.

---

## 📁 Project Structure

EmployeeDirectory/
├── src/
│ ├── main/
│ │ └── resources/
│ │ ├── templates/
│ │ │ └── dashboard.ftlh
│ │ └── static/
│ │ ├── css/
│ │ │ └── style.css
│ │ └── js/
│ │ ├── app.js
│ │ └── data.js
└── README.md

yaml
Copy
Edit

---

## 🚀 How to Run This Project

### Prerequisites

- Java 17+
- Maven or Gradle
- A code editor like **VS Code**
- (Optional) Live Server extension if testing frontend only

---

### 🏃‍♂️ Run Using Spring Boot

1. **Clone the repo or download the code**

```bash
git clone https://github.com/yourusername/employeedirectory.git
cd employeedirectory
Ensure your file structure is correct (see above)

Build & run the project using Maven:

bash
Copy
Edit
./mvnw spring-boot:run
Or with Gradle:

bash
Copy
Edit
./gradlew bootRun
Open your browser and visit:

arduino
Copy
Edit
http://localhost:8080/
🌐 Run Frontend Only (for UI testing)
If you're just testing HTML/CSS/JS:

Rename dashboard.ftlh → dashboard.html

Open dashboard.html with Live Server in VS Code

Note: Freemarker-specific code like <#list> and ${employee.firstName} won't work in this mode.

🛠 Technologies Used
Java 17

Spring Boot

Freemarker Template Engine

HTML5

CSS3

JavaScript (Vanilla)

📦 Features
📋 View all employees

➕ Add new employee

✏️ Edit employee details

❌ Delete employee

🔍 Search employee by name

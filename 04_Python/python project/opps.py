class Person:
    def __init__(self, name, email, phone):
        self.name = name
        self.email = email
        self.phone = phone


class Student(Person):
    def __init__(self, sid, name, email, phone, department,
                 attendance, python, sql, excel):

        super().__init__(name, email, phone)

        self.sid = sid
        self.department = department
        self.attendance = attendance
        self.python = python
        self.sql = sql
        self.excel = excel

    def display(self):
        total = self.python + self.sql + self.excel
        average = total / 3

        print("\n===== STUDENT DETAILS =====")
        print("Student ID:", self.sid)
        print("Name:", self.name)
        print("Email:", self.email)
        print("Phone:", self.phone)
        print("Department:", self.department)
        print("Attendance:", self.attendance, "%")

        if self.attendance >= 75:
            print("Attendance Status: Eligible")
        else:
            print("Attendance Status: Not Eligible")

        print("Python Marks:", self.python)
        print("SQL Marks:", self.sql)
        print("Excel Marks:", self.excel)
        print("Total:", total)
        print("Average:", round(average, 2))

        if average >= 50:
            print("Result: PASS")
        else:
            print("Result: FAIL")

        if average >= 90:
            print("Grade: A+")
        elif average >= 80:
            print("Grade: A")
        elif average >= 70:
            print("Grade: B")
        elif average >= 60:
            print("Grade: C")
        elif average >= 50:
            print("Grade: D")
        else:
            print("Grade: F")


class Faculty(Person):
    def __init__(self, fid, name, email, phone, department):
        super().__init__(name, email, phone)

        self.fid = fid
        self.department = department

    def display(self):
        print("\n===== FACULTY DETAILS =====")
        print("Faculty ID:", self.fid)
        print("Name:", self.name)
        print("Email:", self.email)
        print("Phone:", self.phone)
        print("Department:", self.department)


students = []
faculties = []

while True:
    print("\n===== NOVA UNIVERSITY =====")
    print("1. Add Student")
    print("2. View Students")
    print("3. Add Faculty")
    print("4. View Faculty")
    print("5. Exit")

    choice = input("Enter choice: ")

    if choice == "1":
        sid = input("Student ID: ")
        name = input("Name: ")
        email = input("Email: ")
        phone = input("Phone: ")
        department = input("Department: ")

        attendance = float(input("Attendance (0-100): "))
        python = float(input("Python Marks (0-100): "))
        sql = float(input("SQL Marks (0-100): "))
        excel = float(input("Excel Marks (0-100): "))

        student = Student(
            sid, name, email, phone, department,
            attendance, python, sql, excel
        )

        students.append(student)

        print("\nStudent added successfully!")
        student.display()

    elif choice == "2":
        if len(students) == 0:
            print("No students found.")
        else:
            for student in students:
                student.display()

    elif choice == "3":
        fid = input("Faculty ID: ")
        name = input("Name: ")
        email = input("Email: ")
        phone = input("Phone: ")
        department = input("Department: ")

        faculty = Faculty(
            fid, name, email, phone, department
        )

        faculties.append(faculty)

        print("\nFaculty added successfully!")
        faculty.display()

    elif choice == "4":
        if len(faculties) == 0:
            print("No faculty found.")
        else:
            for faculty in faculties:
                faculty.display()

    elif choice == "5":
        print("Thank you!")
        break

    else:
        print("Invalid choice. Try again.")

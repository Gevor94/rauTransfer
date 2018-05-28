pragma solidity ^0.4.0;

contract RauTransfer {
    //структура данных для хранения информации о студентах 
    mapping(uint16 => Student) public students;

    //структура информации о студентах
    struct Student {
        string name;
        string surname;
        string institute;
        string faculty;
        uint32 tuitionFee;
        uint32 paidFee;
    }

    //добавление студента в структуру данных
    function setStudentInformation(uint16 studentID, string name, string surname,
    string institute, string faculty, uint32 tuitionFee, uint32 paidFee) public {
        students[studentID] = 
        Student(name, surname, institute, faculty, tuitionFee, paidFee);
    }

    //фильтрование должников из предоставленного списка
    function filterDebtorStudents(uint16[] allStudents) public view 
    returns (uint16[] memory debtors) {
        debtors = new uint16[](allStudents.length);
        uint8 counter = 0;
        for (uint8 prop = 0; prop < allStudents.length; prop++) {
            uint16 studentID = allStudents[prop];
            if (students[studentID].paidFee < students[studentID].tuitionFee) {
                debtors[counter] = studentID;
                counter++;
            }
        }
    }

    //получение имени должника
    function getDebtorName(uint16 studentID) public view returns(string name) {
        return students[studentID].name;
    }
    
    //получение фамилии должника
    function getDebtorSurname(uint16 studentID) public view returns(string name) {
        return students[studentID].surname;
    }
    
    //получение института должника
    function getDebtorInstitute(uint16 studentID) public view returns(string name) {
        return students[studentID].institute;
    }
    
    //получение факультета должника
    function getDebtorFaculty(uint16 studentID) public view returns(string name) {
        return students[studentID].faculty;
    }
}


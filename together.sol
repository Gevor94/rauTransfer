pragma solidity ^0.4.0;

contract RauMarks {
    //структура данных для хранения информации о студентах 
    mapping(uint16 => StudentMarks) public studentsMarks;
    mapping(uint16 => StudentFee) public studentsFee;

    //структура информации о студентах
    struct StudentMarks {
        string name;
        string surname;
        string institute;
        string faculty;
        int attendanceMark1;
        int moduleMark1;
        int attendanceMark2;
        int moduleMark2;
        int attendanceMark3;
        int moduleMark3;
    }
    
    //структура информации о студентах
    struct StudentFee {
        string name;
        string surname;
        string institute;
        string faculty;
        uint32 tuitionFee;
        uint32 paidFee;
    }

    //добавление студента в структуру данных
    function setStudentInformation(uint16 studentID, string name, string surname,
    string institute, string faculty, int attendanceMark1, int moduleMark1,
    int attendanceMark2, int moduleMark2,int attendanceMark3, int moduleMark3) public {
        studentsMarks[studentID] = 
        StudentMarks(name, surname, institute, faculty, attendanceMark1, moduleMark1,
        attendanceMark2,moduleMark2, attendanceMark3, moduleMark3);
    }

   //добавление студента в структуру данных
    function setStudentFeeInformation(uint16 studentID, string name, string surname,
    string institute, string faculty, uint32 tuitionFee, uint32 paidFee) public {
        studentsFee[studentID] =
        StudentFee(name, surname, institute, faculty, tuitionFee, paidFee);
    }
    
    //расчет текущего для экзамена
    function getAverageMarkForExam(uint16 studentID) public view 
    returns (int averageMark) {
        int averageForFirstModule = studentsMarks[studentID].attendanceMark1*3/10 + 
                                     studentsMarks[studentID].moduleMark1*7/10;
        int averageForSecondModule = studentsMarks[studentID].attendanceMark2*3/10 + 
                                     studentsMarks[studentID].moduleMark2*7/10;
        int averageForThirdModule = studentsMarks[studentID].attendanceMark3*3/10 + 
                                     studentsMarks[studentID].moduleMark3*7/10;
        return (averageForFirstModule + averageForSecondModule + averageForThirdModule)/3;
    }
    
 

    //фильтрование должников из предоставленного списка
    function filterDebtorStudents(uint16[] allStudents) public view
    returns (uint16[] memory debtors) {
        debtors = new uint16[](allStudents.length);
        uint8 counter = 0;
        for (uint8 prop = 0; prop < allStudents.length; prop++) {
            uint16 studentID = allStudents[prop];
            if (studentsFee[studentID].paidFee < studentsFee[studentID].tuitionFee) {
                debtors[counter] = studentID;
                counter++;
            }
        }
    }

    //получение имени должника
    function getDebtorName(uint16 studentID) public view returns(string name) {
        return studentsFee[studentID].name;
    }

    //получение фамилии должника
    function getDebtorSurname(uint16 studentID) public view returns(string name) {
        return studentsFee[studentID].surname;
    }

    //получение института должника
    function getDebtorInstitute(uint16 studentID) public view returns(string name) {
        return studentsFee[studentID].institute;
    }

    //получение факультета должника
    function getDebtorFaculty(uint16 studentID) public view returns(string name) {
        return studentsFee[studentID].faculty;
    }
}


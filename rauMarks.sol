pragma solidity ^0.4.0;

contract RauMarks {
    //структура данных для хранения информации о студентах 
    mapping(uint16 => Student) public students;

    //структура информации о студентах
    struct Student {
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

    //добавление студента в структуру данных
    function setStudentInformation(uint16 studentID, string name, string surname,
    string institute, string faculty, int attendanceMark1, int moduleMark1,
    int attendanceMark2, int moduleMark2,int attendanceMark3, int moduleMark3) public {
        students[studentID] = 
        Student(name, surname, institute, faculty, attendanceMark1, moduleMark1,
        attendanceMark2,moduleMark2, attendanceMark3, moduleMark3);
    }
    
    //расчет текущего для экзамена
    function getAverageMarkForExam(uint16 studentID) public view 
    returns (int averageMark) {
        int averageForFirstModule = students[studentID].attendanceMark1*3/10 + 
                                     students[studentID].moduleMark1*7/10;
        int averageForSecondModule = students[studentID].attendanceMark2*3/10 + 
                                     students[studentID].moduleMark2*7/10;
        int averageForThirdModule = students[studentID].attendanceMark3*3/10 + 
                                     students[studentID].moduleMark3*7/10;
        return (averageForFirstModule + averageForSecondModule + averageForThirdModule)/3;
    }
}


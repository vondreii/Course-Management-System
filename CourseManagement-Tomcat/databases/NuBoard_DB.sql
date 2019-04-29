-- NuBoard_DB.sql created on 18th Oct 2017
-- By Web Engineers
-- This database consists of Student.. etc...
--
-- - Edited on 19th Oct
--      - Created all tables required in the database, which is then populated by the data
--      - in NuBoard_data.sql
-- - Edited on 24th Oct
--      - fixed error dropping tables
--

-- CREATE DATABASE IF NOT EXISTS NuBoard_DB;
-- USE NuBoard_DB;
USE c3220929_db; --
DROP TABLE IF EXISTS Notification;
DROP TABLE IF EXISTS Announcement;
DROP TABLE IF EXISTS CourseMaterial;
DROP TABLE IF EXISTS StudentEnrolment;
DROP TABLE IF EXISTS ContributionToGroup;
DROP TABLE IF EXISTS TeachingStaffCourseAllocation;
DROP TABLE IF EXISTS ThreadReply;
DROP TABLE IF EXISTS ChatMessage;
DROP TABLE IF EXISTS Semester;
DROP TABLE IF EXISTS ChatBox;
DROP TABLE IF EXISTS AdverseRequest;
DROP TABLE IF EXISTS PeerEvaluationForm;
DROP TABLE IF EXISTS DiscussionBoardThread;
DROP TABLE IF EXISTS AssignmentSubmission;
DROP TABLE IF EXISTS TeachingStaff;
DROP TABLE IF EXISTS DiscussionBoardForum;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS StudentGroup;
DROP TABLE IF EXISTS AssessmentItem;
DROP TABLE IF EXISTS Course;


CREATE TABLE Student (
                studentID CHAR(7) NOT NULL,
                username CHAR(8) NOT NULL UNIQUE,
                password VARCHAR(20) NOT NULL,
                firstName VARCHAR(80) NOT NULL,
                lastName VARCHAR(80) NOT NULL,
                programCode VARCHAR(50) NOT NULL,
                PRIMARY KEY (studentID)
                );

CREATE TABLE Course (
                courseID CHAR(8) NOT NULL,
                courseName VARCHAR(100) NOT NULL,
                units INT NOT NULL,
                PRIMARY KEY (courseID)
                );

CREATE TABLE Semester (
                semID CHAR(6) NOT NULL,
                semester INT NOT NULL,
                year YEAR NOT NULL,
                PRIMARY KEY (semID)
                );

CREATE TABLE TeachingStaff (
                staffNo CHAR(7) NOT NULL,
                numberPlate VARCHAR(20) UNIQUE NOT NULL,
                password VARCHAR(20) NOT NULL,
                firstName VARCHAR(80) NOT NULL,
                lastName VARCHAR(80) NOT NULL,
                PRIMARY KEY (staffNo)
                );

CREATE TABLE ChatBox (
                chatID CHAR(5) NOT NULL,
                noOfMessages INT NOT NULL,
                studentID CHAR(7) NOT NULL,
                staffNo CHAR(7) NOT NULL,
                semID CHAR(6) NOT NULL,
                courseID CHAR(8) NOT NULL,
                PRIMARY KEY (chatID),
                FOREIGN KEY (studentID) REFERENCES StudentEnrolment(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (staffNo) REFERENCES TeachingStaffCourseAllocation(staffNo)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (courseID) REFERENCES StudentEnrolment(courseID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (semID) REFERENCES StudentEnrolment(semID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE StudentGroup (
                groupID CHAR(8) NOT NULL,
                groupName VARCHAR(50) NOT NULL,
                PRIMARY KEY (groupID)
                );

CREATE TABLE StudentEnrolment (
                studentID CHAR(7) NOT NULL,
                semID CHAR(6) NOT NULL,
                courseID CHAR(8) NOT NULL,
                groupID CHAR(8),
                dateEnrolled DATE NOT NULL,
                cumulativeMark DECIMAL(4,2), -- length 4 for 12.23
                finalGrade CHAR(2),
                PRIMARY KEY (studentID, semID, courseID),
                FOREIGN KEY (studentID) REFERENCES Student(StudentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (groupID) REFERENCES StudentGroup(groupID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (courseID) REFERENCES Course(courseID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (semID) REFERENCES Semester(semID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE TeachingStaffCourseAllocation (
                staffNo CHAR(7) NOT NULL,
                courseID CHAR(8) NOT NULL,
                semID CHAR(6) NOT NULL,
                position VARCHAR(100) NOT NULL,
                PRIMARY KEY (staffNo, courseID, semID),
                FOREIGN KEY (staffNo) REFERENCES TeachingStaff(staffNo)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (courseID) REFERENCES Course(courseID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (semID) REFERENCES Semester(semID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE AssessmentItem (
                assessmentItemID CHAR(12) NOT NULL,
                courseID CHAR(8) NOT NULL,
                itemName VARCHAR(100) NOT NULL,
                type VARCHAR(20) NOT NULL,
                weight FLOAT(5,2) NOT NULL,
                dueDate DATETIME NOT NULL,
                description VARCHAR(100),
                specsFileName VARCHAR(100) NOT NULL,
                markingSchemeFileName VARCHAR(100),
                PRIMARY KEY (assessmentItemID),
                FOREIGN KEY (courseID) REFERENCES Course(courseID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE AssignmentSubmission (
                submissionID CHAR(10) NOT NULL,
                assessmentItemID CHAR(12) NOT NULL,
                groupID CHAR(8),
                studentID CHAR(7),
                dateTimeSubmitted DATETIME NOT NULL,
                isLate BOOLEAN,
                isExtensionGranted BOOLEAN,
                totalPossibleMark FLOAT(5,2),
                studentMark FLOAT(5,2),
                submissionFile VARCHAR(100),
                PRIMARY KEY (submissionID),
                FOREIGN KEY (assessmentItemID) REFERENCES AssessmentItem(assessmentItemID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (groupID) REFERENCES StudentGroup(groupID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (studentID) REFERENCES Student(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE PeerEvaluationForm (
                formID CHAR(10) NOT NULL,
                studentID CHAR(7) NOT NULL,
                submissionID CHAR(10),
                formName VARCHAR(100) NOT NULL,
                PRIMARY KEY (formID),
                FOREIGN KEY (studentID) REFERENCES Student(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (submissionID) REFERENCES AssignmentSubmission(submissionID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

-- DONE --
CREATE TABLE DiscussionBoardForum (
                forumID CHAR(10) NOT NULL,
                courseID CHAR(8) NOT NULL,
                forumName VARCHAR(30) NOT NULL,
                dateForumStarted DATETIME NOT NULL,
                numOfThreads INT NOT NULL,
                description VARCHAR(200),
                PRIMARY KEY (forumID),
                FOREIGN KEY (courseID) REFERENCES Course(courseID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );
-- DONE --
CREATE TABLE DiscussionBoardThread (
                threadID CHAR(10) NOT NULL,
                forumID CHAR(10) NOT NULL,
                staffNo CHAR(7),
                studentID CHAR(7),
                threadName VARCHAR(30) NOT NULL,
                threadPost VARCHAR(200) NOT NULL,
                dateThreadStarted DATETIME NOT NULL,
                numOfReplies INT NOT NULL,
                PRIMARY KEY (threadID),
                FOREIGN KEY (forumID) REFERENCES DiscussionBoardForum(forumID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (staffNo) REFERENCES TeachingStaff(staffNo)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (studentID) REFERENCES Student(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );
-- DONE --
CREATE TABLE ThreadReply(
                replyID VARCHAR(10) NOT NULL,
                threadID CHAR(10),
                replierStaffNo CHAR(7),
                replierStudentID CHAR(7),
                messageContent VARCHAR(255) NOT NULL,
                dateTimePosted DATETIME NOT NULL,
                PRIMARY KEY (replyID),
                FOREIGN KEY (threadID) REFERENCES DiscussionBoardThread(threadID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (replierStaffNo) REFERENCES TeachingStaff(staffNo)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (replierStudentID) REFERENCES Student(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );
-- DONE --
CREATE TABLE ChatMessage (
                chatMessageID VARCHAR(10) NOT NULL,
                chatID CHAR(8) NOT NULL,
                replierStaffNo CHAR(7),
                replierStudentID CHAR(7),
                messageContent VARCHAR(255) NOT NULL,
                dateTimePosted DATETIME NOT NULL,
                PRIMARY KEY (chatMessageID),
                FOREIGN KEY (chatID) REFERENCES ChatBox(chatID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (replierStaffNo) REFERENCES TeachingStaff(staffNo)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (replierStudentID) REFERENCES Student(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE AdverseRequest (
                adverseRequestID VARCHAR(20) NOT NULL,
                assessmentItemID CHAR(12) NOT NULL,
                studentID CHAR(7) NOT NULL,
                description VARCHAR(200),
                attachedMedicalDocs VARCHAR(100),
                otherDocs VARCHAR(100),
                status VARCHAR (20) NOT NULL, -- accepted or rejected or pending
                PRIMARY KEY (adverseRequestID),
                FOREIGN KEY (assessmentItemID) REFERENCES AssessmentItem(assessmentItemID)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (studentID) REFERENCES Student(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE Notification (
                notificationID CHAR(8) NOT NULL,
                staffNo CHAR(7),
                studentID CHAR(7),
                notification VARCHAR(50),
                dateTimeReceived DATETIME NOT NULL,
                PRIMARY KEY (notificationID),
                FOREIGN KEY (staffNo) REFERENCES TeachingStaff(staffNo)
                    ON UPDATE CASCADE ON DELETE NO ACTION,
                FOREIGN KEY (studentID) REFERENCES Student(studentID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE Announcement (
                announcementID CHAR(8) NOT NULL,
                title VARCHAR(50) NOT NULL,
                courseID CHAR(8) NOT NULL,
                announcementContent VARCHAR(700) NOT NULL,
                PRIMARY KEY (announcementID),
                FOREIGN KEY (courseID) REFERENCES Course(courseID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );

CREATE TABLE CourseMaterial (
                courseMaterialID CHAR(8) NOT NULL,
                courseID CHAR(8) NOT NULL,
                materialTitle VARCHAR(100) NOT NULL,
                type VARCHAR(20) NOT NULL,
                filename VARCHAR(50) NOT NULL,
                PRIMARY KEY (courseMaterialID),
                FOREIGN KEY (courseID) REFERENCES Course(courseID)
                    ON UPDATE CASCADE ON DELETE NO ACTION
                );


INSERT INTO Student VALUES ('123456', 'c123456', 'default', 'John', 'Dory', 40103);
INSERT INTO Student VALUES ('213453', 'c213453', 'default', 'King', 'Fish', 40103);
INSERT INTO Student VALUES ('213454', 'c213454', 'default', 'Adrien', 'Bordy', 40103);	-- ID changed, was duplicate with King Fish
INSERT INTO Student VALUES ('123532', 'c123532', 'default', 'Ben', 'Kingsley', 40103);
INSERT INTO Student VALUES ('435453', 'c435453', 'default', 'Brad', 'Pitt', 40103);
INSERT INTO Student VALUES ('532456', 'c532456', 'default', 'Bill', 'Murray', 40103);
INSERT INTO Student VALUES ('566453', 'c566453', 'default', 'Antonio', 'Banderas', 40103);
INSERT INTO Student VALUES ('653256', 'c653256', 'default', 'Bob', 'Hoskins', 40103);
INSERT INTO Student VALUES ('545353', 'c545353', 'default', 'Bibi', 'Andersson', 40103);
INSERT INTO Student VALUES ('3238179', 'c3238179', 'password0', 'Jeremiah', 'Smith', 40103); -- Computer science;
INSERT INTO Student VALUES ('3220929', 'c3220929', 'password1', 'Sharlene', 'Von Drehnen', 11497); -- information technology;
INSERT INTO Student VALUES ('3197198', 'c3197198', 'password2', 'Sora', 'Khan', 40103); -- Computer science;

INSERT INTO Course VALUES ('Comp2240', 'Operating Systems', 10);
INSERT INTO Course VALUES ('Comp2241', 'Web Engineering', 10);
INSERT INTO Course VALUES ('Comp2242', 'Cloud Computing', 10);
INSERT INTO Course VALUES ('Seng2242', 'Mobile App Development', 10);
INSERT INTO Course VALUES ('ITLS2242', 'History', 10);
INSERT INTO Course VALUES ('Seng2050', 'Web Engineering', 10);

INSERT INTO Semester VALUES ('2017_1', '1', 2017);
INSERT INTO Semester VALUES ('2017_2', '2', 2017);

INSERT INTO TeachingStaff VALUES ('987654', 'YL123', 'password', 'Yuquing', 'Lin');
INSERT INTO TeachingStaff VALUES ('987234', 'HC123', 'password', 'Hayden', 'Cheers');
INSERT INTO TeachingStaff VALUES ('945644', 'BB123', 'password', 'Bugs', 'Bunny');
INSERT INTO TeachingStaff VALUES ('234561', 'BS123', 'password', 'Bart', 'Simpson');
INSERT INTO TeachingStaff VALUES ('945444', 'TG123', 'password', 'The', 'Grinch');
INSERT INTO TeachingStaff VALUES ('984451', 'P123', 'password', 'Popeye', '');
INSERT INTO TeachingStaff VALUES ('923644', 'DD123', 'password', 'Daffy', 'Duck');
INSERT INTO TeachingStaff VALUES ('567451', 'BB321', 'password', 'Betty', 'Boop');
INSERT INTO TeachingStaff VALUES ('923645', 'GJ123', 'password', 'George', 'Jetson'); -- original staff ID was duplicate CHANGED FROM 923644 TO 923645;

INSERT INTO ChatBox VALUES ('CH001', 2, '123456', '987654', '2017_2', 'Comp2240');
INSERT INTO ChatBox VALUES ('CH002', 1, '123456', '945644', '2017_2', 'Comp2241');
INSERT INTO ChatBox VALUES ('CH003', 1, '213453', '987234', '2017_2', 'Comp2240');
INSERT INTO ChatBox VALUES ('CH004', 0, '532456', '923644', '2017_2', 'ITLS2242');

INSERT INTO StudentGroup VALUES ('GROUP_01', 'Web Engineers');
INSERT INTO StudentGroup VALUES ('GROUP_02', 'Coca Cola');
INSERT INTO StudentGroup VALUES ('GROUP_03', 'Alduin');
INSERT INTO StudentGroup VALUES ('GROUP_04', 'Paarthurnax');
INSERT INTO StudentGroup VALUES ('GROUP_05', 'Team Yuqing Bling');
INSERT INTO StudentGroup VALUES ('GROUP_06', 'Cheers for Beers');
INSERT INTO StudentGroup VALUES ('GROUP_07', 'Team Dovahkiin');

INSERT INTO StudentEnrolment VALUES ('123456', '2017_2', 'Comp2240', 'GROUP_02', '2017-07-29', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('213453', '2017_2', 'Comp2240', 'GROUP_02', '2017-07-29', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('545353', '2017_2', 'Comp2240', 'GROUP_03', '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('123532', '2017_2', 'Comp2240', 'GROUP_04', '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('435453', '2017_2', 'Comp2240', 'GROUP_04', '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('532456', '2017_2', 'Comp2240', 'GROUP_04', '2017-07-28', NULL, NULL);

INSERT INTO StudentEnrolment VALUES ('123456', '2017_2', 'Comp2241', 'GROUP_05', '2017-06-15', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('123532', '2017_2', 'Comp2241', 'GROUP_05', '2017-07-28', NULL, NULL);

INSERT INTO StudentEnrolment VALUES ('123456', '2017_2', 'Comp2242', NULL, '2017-07-27', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('123532', '2017_2', 'Comp2242', 'GROUP_07', '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('435453', '2017_2', 'Comp2242', 'GROUP_06', '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('532456', '2017_2', 'Comp2242', 'GROUP_07', '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('566453', '2017_2', 'Comp2242', 'GROUP_07', '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('653256', '2017_2', 'Comp2242', 'GROUP_07', '2017-07-28', NULL, NULL);

INSERT INTO StudentEnrolment VALUES ('123532', '2017_2', 'Seng2242', NULL, '2017-07-28', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('435453', '2017_2', 'Seng2242', NULL, '2017-07-28', NULL, NULL);

INSERT INTO StudentEnrolment VALUES ('532456', '2017_2', 'ITLS2242', NULL, '2017-07-28', NULL, NULL);

INSERT INTO StudentEnrolment VALUES ('3238179', '2017_2', 'Seng2050', 'GROUP_01', '2017-07-29', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('3220929', '2017_2', 'Seng2050', 'GROUP_01', '2017-07-29', NULL, NULL);
INSERT INTO StudentEnrolment VALUES ('3197198', '2017_2', 'Seng2050', 'GROUP_01', '2017-07-30', NULL, NULL);

INSERT INTO TeachingStaffCourseAllocation VALUES ('987654', 'Comp2240', '2017_2', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('987234', 'Comp2240', '2017_2', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('987654', 'Comp2241', '2017_2', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('945644', 'Comp2241', '2017_1', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('234561', 'Comp2242', '2017_1', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('945444', 'Comp2242', '2017_1', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('984451', 'Seng2242', '2017_2', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('923644', 'Seng2242', '2017_1', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('567451', 'ITLS2242', '2017_2', 'Lecturer');
INSERT INTO TeachingStaffCourseAllocation VALUES ('923644', 'ITLS2242', '2017_1', 'Lecturer');

INSERT INTO AssessmentItem VALUES ('Seng2050_001', 'Seng2050','Assignment1', 'Individual', 12.0, '2017-08-21 23:59:59', 'Programming assignment 1', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('Seng2050_002', 'Seng2050','Assignment2', 'Individual', 12.0, '2017-09-11 23:59:59', 'Programming assignment 2', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('Seng2050_003', 'Seng2050','Assignment3', 'Group', 25.0, '2017-10-30 23:59:59', 'Group Project', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('Comp2240_001', 'Comp2240', 'Assignment1', 'Group', 10.0, '2017-08-31 23:59:59', 'Programming assignment 1', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('Comp2241_001', 'Comp2241', 'Assignment1', 'Group', 10.0, '2017-08-27 10:00:00', 'Report', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('Comp2242_001', 'Comp2242', 'Assignment1', 'Group', 10.0, '2017-08-29 23:59:59', 'Assignment 1', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('Seng2242_001', 'Seng2242', 'Assignment1', 'Group', 10.0, '2017-09-01 23:59:59', 'Programming Assignment 1', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('Seng2242_002', 'Seng2242', 'Assignment1', 'Group', 10.0, '2017-09-02 23:59:59', 'Assignment 2', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('ITLS2242_001', 'ITLS2242', 'Assignment1', 'Individual', 10.0, '2017-08-25 17:00:00', 'ITLS Assignment 1', 'Specs', 'MarkignSchema');
INSERT INTO AssessmentItem VALUES ('ITLS2242_002', 'ITLS2242', 'Assignment1', 'Individual', 10.0, '2017-08-25 23:59:59', 'ITLS Assignment 2', 'Specs', 'MarkingSchema');
INSERT INTO AssessmentItem VALUES ('ITLS2242_003', 'ITLS2242', 'Assignment1', 'Individual', 10.0, '2017-09-03 23:59:59', 'ITLS Assignment 3', 'Specs', 'MarkingSchema');

INSERT INTO AssignmentSubmission VALUES ('ND74HF93JS', 'Seng2050_003', 'GROUP_01', NULL, '2017-10-30 22:31:59', false, false, 100.0, 99.9, 'Assignment3_File.zip');
INSERT INTO AssignmentSubmission VALUES ('GDHFIEBVBF', 'Comp2240_001', 'GROUP_04', NULL, '2017-10-20 13:56:24', false, false, 100.0, 99.9, 'Assignment1_File.zip');
INSERT INTO AssignmentSubmission VALUES ('FEHHF3EWRF', 'Comp2240_001', 'GROUP_03', NULL, '2017-10-27 09:26:25', false, false, 100.0, 99.9, 'Assignment1_File.zip');
INSERT INTO AssignmentSubmission VALUES ('436BVJDGGW', 'Comp2241_001', 'GROUP_05', NULL, '2017-10-27 10:23:56', false, false, 100.0, 99.9, 'Assignment1_File.zip');
INSERT INTO AssignmentSubmission VALUES ('WIYTUGR44T', 'Comp2242_001', 'GROUP_06', NULL, '2017-10-20 12:34:34', false, false, 100.0, 99.9, 'Assignment2_File.zip');

INSERT INTO AssignmentSubmission VALUES ('AS36JL7XSL', 'Comp2242_001', NULL, '123456', '2017-08-15 23:58:59', false, true, 100.0, 95, 'Assignment1_File.zip');
INSERT INTO AssignmentSubmission VALUES ('6PLSXFKME6', 'Comp2242_001', NULL, '123532', '2017-08-14 16:50:23', false, true, 100.0, 95, 'Assignment1_File.zip');
INSERT INTO AssignmentSubmission VALUES ('HFUWEU3EWT', 'ITLS2242_001', NULL, '532456', '2017-08-14 16:50:23', false, true, 100.0, 95, 'Assignment1_File.zip');
INSERT INTO AssignmentSubmission VALUES ('DFYW6332VR', 'ITLS2242_002', NULL, '532456', '2017-08-14 16:50:23', false, true, 100.0, 95, 'Assignment2_File.zip');
INSERT INTO AssignmentSubmission VALUES ('RTREFVDHIU', 'ITLS2242_003', NULL, '532456', '2017-08-14 16:50:23', false, true, 100.0, 95, 'Assignment3_File.zip');

INSERT INTO PeerEvaluationForm VALUES ('PEF_4FHGU7', '3238179', 'ND74HF93JS', 'Seng2050 Project Peer Evaluation Form');
INSERT INTO PeerEvaluationForm VALUES ('PEF_VWEJWR', '3220929', 'ND74HF93JS', 'Seng2050 Project Peer Evaluation Form');
INSERT INTO PeerEvaluationForm VALUES ('PEF_AFRHR3', '3197198', 'ND74HF93JS', 'Seng2050 Project Peer Evaluation Form');

INSERT INTO PeerEvaluationForm VALUES ('PEF_HJUGE8', '123532', 'GDHFIEBVBF', 'Seng2240_A1 Project Peer Evaluation Form');
INSERT INTO PeerEvaluationForm VALUES ('PEF_003J03', '435453', 'GDHFIEBVBF', 'Seng2240_A1 Project Peer Evaluation Form');
INSERT INTO PeerEvaluationForm VALUES ('PEF_0FWWE5', '532456', 'GDHFIEBVBF', 'Seng2240_A1 Project Peer Evaluation Form');

INSERT INTO PeerEvaluationForm VALUES ('PEF_FKME55', '545353', 'FEHHF3EWRF', 'Seng2240_A1 Project Peer Evaluation Form');

INSERT INTO PeerEvaluationForm VALUES ('PEF_GTREBB', '123456', '436BVJDGGW', 'Seng2240_A1 Project Peer Evaluation Form');
INSERT INTO PeerEvaluationForm VALUES ('PEF_FKUAAA', '123532', '436BVJDGGW', 'Seng2240_A1 Project Peer Evaluation Form');

INSERT INTO PeerEvaluationForm VALUES ('PEF_FG2335', '435453', 'WIYTUGR44T', 'Seng2240_A1 Project Peer Evaluation Form');

INSERT INTO DiscussionBoardForum VALUES ('FORUM_001', 'Seng2050', 'Assignment 1 Common Errors', '2017-08-20 12:45:30', 1, null);
INSERT INTO DiscussionBoardForum VALUES ('FORUM_002', 'Seng2050', 'Assignment 3 Questions', '2017-09-20 10:10:30', 3, null);
INSERT INTO DiscussionBoardForum VALUES ('FORUM_003', 'Comp2240', 'Other Resources', '2017-08-20 15:20:31', 1, null);
INSERT INTO DiscussionBoardForum VALUES ('FORUM_004', 'Comp2240', 'Questions regarding labs', '2017-19-23 14:11:11', 0, null);
INSERT INTO DiscussionBoardForum VALUES ('FORUM_005', 'Comp2241', 'More Resources', '2017-11-21 10:10:11', 0, null);
INSERT INTO DiscussionBoardForum VALUES ('FORUM_006', 'Comp2242', 'Forum for Questions', '2017-14-21 10:10:16', 0, null);
INSERT INTO DiscussionBoardForum VALUES ('FORUM_007', 'Seng2242', 'Forum for Questions', '2017-14-21 10:10:16', 0, null);
INSERT INTO DiscussionBoardForum VALUES ('FORUM_008', 'ITLS2242', 'Forum for Questions', '2017-14-21 10:10:16', 0, null);

INSERT INTO DiscussionBoardThread VALUES ('THEAD_001', 'FORUM_001', '987654', NULL, 'Creating a limit of 3 bookings', 'Please see the following link for how to solve this problem: www.fixbookingproblems.com', '2017-08-20 16:10:56', 0);
INSERT INTO DiscussionBoardThread VALUES ('THEAD_002', 'FORUM_002', NULL, '3220929', 'I do not understand SQL', 'What is SQL and how do I use it for this Assignment? Please help!', '2017-10-11 09:04:01', 0);
INSERT INTO DiscussionBoardThread VALUES ('THEAD_003', 'FORUM_002', NULL, '3220929', 'What do I do', 'I am having trouble starting Assignment 3. What is an MVC? Do we need to connect the JavaScript Beans to it?', '2017-09-24 16:12:24', 0);
INSERT INTO DiscussionBoardThread VALUES ('THEAD_004', 'FORUM_002', NULL, '3220929', 'How do I start Tomcat', 'I did not Complete A1 and A2. I thought I could pass if I just did A3 and the final. But, I cannot find out how to start tomcat and the Assignment is due tomorrow! Need help ASAP!', '2017-10-29 22:07:27', 1);

INSERT INTO ThreadReply VALUES ('RL_001_001', 'THEAD_004', '987654', NULL, 'You should have done the Labs and Assignments', '2017-10-30 12:04:23');
INSERT INTO ThreadReply VALUES ('RL_001_002', 'THEAD_002', NULL, '3197198', 'This is a stupid thread', '2017-10-29 15:12:45');

INSERT INTO ChatMessage VALUES ('M_35H8II97', 'CH001', NULL, '3220929', 'Hi Yuqing. I was wondering if you can explain some of my feedback to me for A1?', '2017-08-18 10:10:20');
INSERT INTO ChatMessage VALUES ('M_G6J8DGG0', 'CH001', '987654', NULL, 'Of course. You can see me in my office at 10:30 tomorrow.',  '2017-08-18 11:04:09');
INSERT INTO ChatMessage VALUES ('M_F678KVS1', 'CH002', NULL, '3220929', 'Are there labs next week?',  '2017-08-18 11:04:48');
INSERT INTO ChatMessage VALUES ('M_555HHJ9S', 'CH003', NULL, '3238179', 'How do I Java',  '2017-08-18 11:05:12');

INSERT INTO AdverseRequest VALUES ('ADVRUIU34X', 'Seng2050_002', '3220929', 'My cat is sad today', null, null, 'Rejected');
INSERT INTO AdverseRequest VALUES ('ADVR5JK93F', 'Seng2050_002', '3197198', 'My shoulder hurts', 'Medical Certificate for shoulder', 'Letter of sympathy', 'Accepted');
INSERT INTO AdverseRequest VALUES ('ADVRH7JH54', 'Seng2050_003', '3197198', 'My shoulder hurts again', 'MedicalDoc', null, 'Pending');

INSERT INTO Notification VALUES ('N_956HI8', NULL, '3220929', 'Your adverse request has been rejected', '2017-08-29 09:10:20');
INSERT INTO Notification VALUES ('N_G9JJGS', NULL, '3197198', 'Your adverse request has been accepted', '2017-08-29 09:12:49');

INSERT INTO Announcement VALUES ('ANN00001', 'Assignment extension', 'Seng2050', 'Dear all, I will be extending the due date of Assignment 3 to January 21st, 2018.');
INSERT INTO Announcement VALUES ('ANN00002', 'Assignment 1 Marks', 'Comp2240', 'Assignment 1 marks have been released.');

INSERT INTO CourseMaterial VALUES ('CMID0001', 'Seng2050', 'Lecture 1: Servlets', 'Lecture', 'Seng2050_lec_01.pdf');
INSERT INTO CourseMaterial VALUES ('CMID0002', 'Seng2050', S'Lecture 2: JSPs', 'Lecture', 'Seng2050_lec_02.pdf');
INSERT INTO CourseMaterial VALUES ('CMID0003', 'Seng2050', 'Lab 1: Introduction to Servlets', 'Lab', 'lab01.zip');
INSERT INTO CourseMaterial VALUES ('CMID0004', 'Seng2050', 'Lab 7: SQL and JDBC', 'Lab', 'lab07.zip');




-- INSERT INTO StudentEnrolment ('', '', '', );

-- INSERT INTO Student VALUES ('3000001', 'c3000001', 'password4', 'Jake', 'Smith', 12348); -- Bachelor of Laws (Honours); Combined
-- INSERT INTO Student VALUES ('3000002', 'c3000002', 'password5', 'Ashley', 'Longmuir', 10716); -- Social science
-- INSERT INTO Student VALUES ('3000003', 'c3000003', 'password6', 'Jordan', 'Thorley', 40064); -- Engineering (Mechatronics); (honours);
-- INSERT INTO Student VALUES ('3000004', 'c3000004', 'password7', 'Kiara', 'Gardener', 11725); -- nursing
-- INSERT INTO Student VALUES ('3000005', 'c3000005', 'password8', 'Robin', 'Baker', 40096); -- arts
-- INSERT INTO Student VALUES ('3000006', 'c3000006', 'password9', 'Gregory', 'Prescott', 10981); -- Biotechnolgy

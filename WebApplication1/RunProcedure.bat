
sqlcmd -S LAPTOP-IA1VDG6L\SQLEXPRESS -d defaultDB -Q "EXEC dbo.InsertIntoDoctorAccessAppointment @FullName='Jane Doe', @BloodType='A+', @Gender='Female', @Contact='9876543210', @Email='janedoe@example.com', @ProblemDescription='Fever', @BirthDate='1990-01-01', @Address='456 Elm St', @Username='janedoe', @Password='securepassword'"
pause

pause

using ExcelDataReader;
using ExcelToSqlDataEntry.db;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ExcelToSqlDataEntry
{
    class Program
    {
        protected static string getPassword()
        {
            Random random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, 6)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        static void Main(string[] args)
        {
            using (var stream = File.Open(@"D:\szebist_Std_Info.xlsx", FileMode.Open, FileAccess.Read))
            {
                using (var reader = ExcelReaderFactory.CreateReader(stream))
                {

                    while (reader.Read()) //Each ROW
                    {
                        //for (int i = 0; i < reader.FieldCount; i++)
                        //{


                        //}
                        using (DataClasses1DataContext eDataBase = new DataClasses1DataContext())
                        {
                            var eClass = eDataBase.Classes.Where(eCData => eCData.ClassName.Trim().ToLower() == reader.GetString(3).Trim().ToLower()
                                        & eCData.IsActive == true & eCData.IsDeleted == false).FirstOrDefault();
                            if (eClass != null)
                            {
                                Student eStudent = new Student();
                                eStudent.UserName = reader.GetString(0).Trim();
                                eStudent.ClassId = eClass.Id;
                                eStudent.FatherName = reader.GetString(1).Trim();
                                eStudent.Email = reader.GetValue(2).ToString().Trim();
                                eStudent.LoginId = reader.GetValue(2).ToString().Trim();
                                eStudent.Password = getPassword();
                                eStudent.IsActive = true;
                                eStudent.IsDeleted = false;
                                eDataBase.Students.InsertOnSubmit(eStudent);
                                eDataBase.SubmitChanges();
                            }
                            else
                            {
                                Class _eClass = new Class();
                                _eClass.SchoolId = 93;
                                _eClass.ClassName = reader.GetString(3).Trim();
                                _eClass.IsActive = true;
                                _eClass.IsDeleted = false;
                                eDataBase.Classes.InsertOnSubmit(_eClass);
                                eDataBase.SubmitChanges();
                                Student eStudent = new Student();
                                eStudent.UserName = reader.GetString(0).Trim();
                                eStudent.ClassId = _eClass.Id;
                                eStudent.FatherName = reader.GetString(1).Trim();
                                eStudent.Email = reader.GetValue(2).ToString().Trim();
                                eStudent.LoginId = reader.GetValue(2).ToString().Trim();
                                eStudent.Password = getPassword();
                                eStudent.IsActive = true;
                                eStudent.IsDeleted = false;
                                eDataBase.Students.InsertOnSubmit(eStudent);
                                eDataBase.SubmitChanges();
                            }
                            

                        }
                        Thread.Sleep(2000);
                    }

                    /*while (reader.NextResult());*/ //Move to NEXT SHEET


                }
            }
        }
    }
}

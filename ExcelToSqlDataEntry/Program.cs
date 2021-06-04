using ExcelDataReader;
using ExcelToSqlDataEntry.db;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExcelToSqlDataEntry
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var stream = File.Open(@"C:\Users\A.U Computer\Desktop\274449-0045fb5f54f9ad357e301cf30e23d9834058618a\nationalities.xlsx", FileMode.Open, FileAccess.Read))
            {
                using (var reader = ExcelReaderFactory.CreateReader(stream))
                {

                    while (reader.Read()) //Each ROW
                    {
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            using (DataClasses1DataContext eDataBase = new DataClasses1DataContext())
                            {
                                Nationality nationality = new Nationality();
                                nationality.Name = reader.GetValue(i).ToString();
                                nationality.IsActive = true;
                                eDataBase.Nationalities.InsertOnSubmit(nationality);
                                eDataBase.SubmitChanges();

                            }
                        }
                            
                    }

                    /*while (reader.NextResult());*/ //Move to NEXT SHEET


                }
            }
        }
    }
}

namespace Vidly.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class membership : DbMigration
    {
        public override void Up()
        {
            Sql("INSERT INTO MembershipTypes (Id, SignUpFree, DurationInMonths, DiscountRate) VALUES (1, 0 , 0, 0)");
            Sql("INSERT INTO MembershipTypes (Id, SignUpFree, DurationInMonths, DiscountRate) VALUES (2, 30 , 1, 10)");
            Sql("INSERT INTO MembershipTypes (Id, SignUpFree, DurationInMonths, DiscountRate) VALUES (3, 0 , 0, 0)");
            Sql("INSERT INTO MembershipTypes (Id, SignUpFree, DurationInMonths, DiscountRate) VALUES (4, 300 , 12, 20)");

            Sql("UPDATE MembershipTypes SET Name = 'Pay as You Go' WHERE Id = 1");
            Sql("UPDATE MembershipTypes SET Name = 'Monthly' WHERE Id = 2");
            Sql("UPDATE MembershipTypes SET Name = 'Quarterly' WHERE Id = 3");
            Sql("UPDATE MembershipTypes SET Name = 'Annual' WHERE Id = 4");
        }
        
        public override void Down()
        {
        }
    }
}

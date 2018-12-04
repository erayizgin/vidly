namespace Vidly.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DiffDatabase : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Customers", "Birthdate", c => c.DateTime());
            AddColumn("dbo.MembershipTypes", "Name", c => c.String());
            AlterColumn("dbo.Customers", "Name", c => c.String(nullable: false, maxLength: 255));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Customers", "Name", c => c.String());
            DropColumn("dbo.MembershipTypes", "Name");
            DropColumn("dbo.Customers", "Birthdate");
        }
    }
}

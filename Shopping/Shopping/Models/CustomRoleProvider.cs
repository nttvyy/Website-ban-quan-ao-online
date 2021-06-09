﻿using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Shopping.Models
{
    public class CustomRoleProvider : RoleProvider
    {
        QAShop1Entities1 db = new QAShop1Entities1();

        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string name)
        {
            //tạo biến getrole, so sánh xem UserID đang đăng nhập có giống với tên trong db ko
            User account = db.Users.Single(x => x.UserID.Equals(name));
            if (account != null) // Nếu giống
            {
                return new String[] { account.Role.RoleName };
            }
            else
                return new String[] { };

            //string data = db.Users.Where(x => x.UserName == name).FirstOrDefault().Role;
            //string[] result = { data };
            //return result;
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}
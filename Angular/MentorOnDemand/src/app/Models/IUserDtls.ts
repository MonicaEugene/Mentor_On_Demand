export interface IUserDtls
{
    id:number;
    username:string;
    userPassword:string;
    firstName:string;
    lastName:string;
    contactNumber:number;
    regDatetime:Date;
    regCode:string;
    forceResetPassword:boolean;
}
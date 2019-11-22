export interface IMentor
{
    id:number;
    username:string;
    mentorPassword:string;
    firstName:string;
    lastName:string;
    contactNumber:number;
    regDatetime:Date;
    regCode:string;
    forceResetPassword:boolean;
    linkedinUrl:string;
    yearsOfExperience:number;
}
#ifndef ERRORCODE_H
#define ERRORCODE_H

typedef enum{
    PasswordError = 0,      //密码错误
    AnswerError,            //密保答案错误
    UserNameExist,          //用户名已存在
    UserNameNotExist,       //用户名不存在
    UserCreateError,        //用户注册失败
    UserInfoUpdataError,    //用户信息更新错误
}e_ErrorCode;
#endif // ERRORCODE_H
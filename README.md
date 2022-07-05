# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Seed Untuk Roles
- Setelah migrate, seed dulu, karena untuk pembuatan user harus memiliki role id, jadi harus inisiali data di role dulu baru dari role tersebut kita gunakakan id-nya untuk pembuatan user (nantinya dapat token auth untuk login)

reset migrate database
> ``rake db:migrade:redo``

seed
> ``rake db:seed``

## Alur User
Sebelumnya untuk mengecek route berserta controller yang digunakan bisa menggunakan command di terminal:

- ``rails routes``

atau kalau di lagi berjalan di web dengan url:

- ``localhost/rails/info/routes``

Selanjutnya untuk Alur User, untuk saat ini ada beberapa seperti Create, SignIn, SignOut dan Refresh Token.

### Create
untuk membuat akun dapat melakukan POST ke `/users/sign_up` dengan parameter berupa JSON berikut:
```
{
    "user":{
        "username" : "33Dico",
        "password": "qwerty123",
        "email": "33a@gmail.com",
        "name":"Skylark White",
        "address":"Nevada",
        "gender":"Male",
        "balance":"0",
        "role_id":1
    }
}
```
><details>
>  <summary>Screenshot</summary>
>  
>  ![1_create!](/public/docs/images/1_create.PNG)
>  
></details>

kemudian akan mendapatkan response seperti ini jika berhasil: 
```
{
    "status": true,
    "code": 200,
    "message": "Sucessfully Create User",
    "data": {
        "id": 3,
        "email": "33a@gmail.com",
        "name": "Skylark White",
        "created_at": "2022-07-05T03:54:45.375Z",
        "updated_at": "2022-07-05T03:54:45.375Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE2NTY5OTY4ODUsImlhdCI6MTY1Njk5MzI4NSwiaWQiOiJpZCJ9.bCsKEyUns1qN9DYxMidZDnqEKmfhKchZqih2f2Yj4V4",
    "refresh_token": "jjJxwccKhk1f0nzFIwr6RQ"
}
```
><details>
>  <summary>Screenshot</summary>
>  
>  ![2_create!](/public/docs/images/2_create.PNG)
>  
></details>


### SignIn
Setelah berhasil membuat akun, selanjutnya untuk login bisa dengan menggunakan URL POST: `/users/sign_in` dan params yang dibutuhkan seperti ini.
```
{
    "email": "33a@gmail.com",
    "password": "qwerty123"
}
```
><details>
>  <summary>POST</summary>
>  
>  ![3_signin!](/public/docs/images/3_signin.PNG)
>  
></details>

kemudian akan mendapatkan response seperti ini jika berhasil: 
```
{
    "status": true,
    "code": 200,
    "message": "Log in Sucessfully",
    "data": {
        "id": 3,
        "email": "33a@gmail.com",
        "name": "Skylark White",
        "created_at": "2022-07-05T03:54:45.375Z",
        "updated_at": "2022-07-05T03:54:45.375Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE2NTY5OTc0NTYsImlhdCI6MTY1Njk5Mzg1NiwiaWQiOiJpZCJ9.QB_itWYGOaZLO3uwo1jGSR7IzP-6Wixbif4XQxiownU",
    "refresh_token": "8aVpUwETaTBaQk28aTndZw"
}
```
><details>
>  <summary>Response</summary>
>  
>  ![4_signin!](/public/docs/images/4_signin.PNG)
>  
></details>

### SignOut
Untuk Logout bisa dengan menggunakan URL DELETE: `/users/sign_out` yang dimana tidak ada params yang diberikan, tetapi harus memasukan token (dalam hal ini ``"Bearer " + token``) seperti ini.

><details>
>  <summary>Bearer Token</summary>
>  
>  ![5_signout!](/public/docs/images/5_signout.PNG)
>  
></details>

Maka nanti response yang diberikan.

><details>
>  <summary>Response</summary>
>  
>  ![6_signout!](/public/docs/images/6_signout.PNG)
>  
></details>

### Refresh Token
untuk refresh token ini digunakan jika token expired, dengan menggunakan refresh_token yang telah diberikan ketika create user atau login.
Dengan mengunjugi URL POST : `http://127.0.0.1:3000/users/tokens` dengan params **Bearer Token** dan juga **Refresh-Token** pada Header. seperti ini:

untuk token

><details>
>  <summary>Token</summary>
>  
>  ![5_signout!](/public/docs/images/5_signout.PNG)
>  
></details>


untuk Refresh-Token pada Header

><details>
>  <summary>Refresh Token</summary>
>  
>  ![7_refresh_token!](/public/docs/images/7_refresh_token.PNG)
>  
></details>

jika berhasil, maka response yang dihasilkan akan seperti ini:

><details>
>  <summary>Response Refresh Token</summary>
>  
>  ![8_refresh_token!](/public/docs/images/8_refresh_token.PNG)
>  
></details>

## Profile
Untuk mendapatkan detail profile dapat melakukan GET pada route alamat `/profile` dengan **params** sebagai berikut. pastikan juga **bearer token** sudah di isi.
```
{
    "email": "johndoe1@gmail.com"
}
```

kemudian akan mendapatkan output sebagai berikut

```
{
    "status": "true",
    "code": 200,
    "data": {
        "name": "John Doe",
        "username": "johndoe1",
        "email": "jo******@gmail.com",
        "address": "jakarta",
        "balance": "Rp.0.0",
        "role": "User"
    }
}
```

Example:
><details>
>  <summary>Screenshot</summary>
>
>  ![9_get_profile!](/public/docs/images/9_get_profile.png)
>  
></details>
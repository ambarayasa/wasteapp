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

> ### Create
>>untuk Create ini menggunakan URL POST:
>>``http://127.0.0.1:3000/users/sign_up`` dimana nanti akan meminta parameter berupa JSON yang berisi "user" berserta params yang dibutuhkan.
![1_create!](/public/docs/images/1_create.PNG)
yang nantinya akan memberikan response seperti ini jika berhasil:
![2_create!](/public/docs/images/2_create.PNG)

> ### SignIn
>>Setelah berhasil membuat akun, selanjutnya untuk login bisa dengan menggunakan URL POST: ``http://127.0.0.1:3000/users/sign_in`` dan params yang dibutuhkan seperti ini.
![3_signin!](/public/docs/images/3_signin.PNG)
>>Selanjutnya, response yang diberikan seperti berikut
![4_signin!](/public/docs/images/4_signin.PNG)

> ### SignOut
>>Untuk Logout bisa dengan menggunakan URL DELETE: ``http://127.0.0.1:3000/users/sign_out`` yang dimana tidak ada params yang diberikan, tetapi harus memasukan token (dalam hal ini ``"Bearer " + token``) seperti ini.
![5_signout!](/public/docs/images/5_signout.PNG)
>>Maka nanti response yang diberikan.
![6_signout!](/public/docs/images/6_signout.PNG)

> ### Refresh Token
>> untuk refresh token ini digunakan jika token expired, dengan menggunakan refresh_token yang telah diberikan ketika create user atau login.
>> Dengan mengunjugi URL POST : ``http://127.0.0.1:3000/users/tokens`` dengan params **Bearer Token** dan juga **Refresh-Token** pada Header. seperti ini:
>> <br> untuk token
![5_signout!](/public/docs/images/5_signout.PNG)
>> <br> untuk Refresh-Token pada Header
![7_refresh_token!](/public/docs/images/7_refresh_token.PNG)
>> <br> jika berhasil, maka response yang dihasilkan akan seperti ini:
![8_refresh_token!](/public/docs/images/8_refresh_token.PNG)







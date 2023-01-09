# rust-zero-backend

This Rust backend alows a consumer to subscribe to a newsletter, confirm that subscription via a unique confirmation link emailed to them, then receive new issues of the news letter in HTML & Plain Text format to their email address on file.

The project is built in Rust using Actix-Web and runs on a Tokio runtime with a PostgreSQL database implementaion. It includes full CI/CD integration via Github Actions and is deployed to the cloud with Docker on Digital Ocean.  

Test support includes unit & integration test suites.

Note: This project is in progress and not yet complete.  As such, utilizing the publicly deployed endpoints will subscribe you to the newsletter and register you in the database, but you will not receive a valid confirmation email and link to complete your subscription yet.  Keep in mind these api's are not yet secured and should not be consumed publicly with any personal information, even your email.

This project should be MVP complete and production ready Feb 2023.  

Full API documentation, Rustdoc, and expanded ReadMe details will be added once project is 1.0 and production ready.

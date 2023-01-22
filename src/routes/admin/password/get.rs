use crate::authentication::UserId;
use actix_web::http::header::ContentType;
use actix_web::{web, HttpResponse};
use actix_web_flash_messages::IncomingFlashMessages;
use std::fmt::Write;

pub async fn change_password_form(
    user_id: web::ReqData<UserId>,
    flash_message: IncomingFlashMessages,
) -> Result<HttpResponse, actix_web::Error> {
    let _user_id = user_id.into_inner();

    let mut msg_html = String::new();

    for m in flash_message.iter() {
        writeln!(msg_html, "<p><i>{}</i></p>", m.content()).unwrap();
    }

    Ok(HttpResponse::Ok()
        .content_type(ContentType::html())
        .body(format!(
            r#"<!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta http-equiv="content-type" content="text/html; charset=utf-8">
                    <title>Change Password</title>
                </head>
                <body>
                    {msg_html}
                    <form 
                        action="/admin/password" 
                        method="post"
                    >
                        <label>Current password
                        <input
                            type="password"
                            placeholder="Enter current password"
                            name="current_password"
                        >
                        </label>
                        <br>
                        <label>New password
                            <input
                                type="password"
                                placeholder="Enter new password"
                                name="new_password"
                            >
                        </label>
                        <br>
                        <label>Confirm new password
                            <input
                                type="password"
                                placeholder="Type the new password again"
                                name="new_password_check"
                            >
                        </label>
                        <br>
                        <button type="submit">Change password</button>
                    </form>
                    <p><a href="/admin/dashboard">&lt;- Back</a></p>
                </body>
            </html>"#,
        )))
}

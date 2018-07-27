-- Verify Main:002_create_table_for_auth on pg

BEGIN;

SELECT user_id, created_time, updated_time, grant_email_validate,
    grant_password, grant_session, resource_ddns, resource_server_info
FROM auth_flags;

SELECT user_id, created_time, updated_time, validate_status
FROM auth_grant_email_validate;

SELECT user_id, created_time, updated_time, password
FROM auth_grant_password;

SELECT user_id, created_time, session_key, last_seen
FROM auth_grant_session;

DO $$
BEGIN
    ASSERT verify_password('a', hash_password('a'));
    ASSERT NOT verify_password('a', hash_password('aa'));
    ASSERT NOT verify_password(NULL, hash_password('aa'));
    ASSERT NOT verify_password('a', hash_password(NULL));
    ASSERT NOT verify_password(NULL, hash_password(NULL));
END;
$$;

ROLLBACK;
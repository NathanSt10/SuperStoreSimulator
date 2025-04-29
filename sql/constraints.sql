use super_store_sim_db;
alter table members
add constraint chk_membership_type
check (membership in (1, 2, 3));

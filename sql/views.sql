use super_store_sim_db;
create view `all_members_query` 
as select m.first_name, m.last_name, m.full_name, m.email, m.phone_number, mem.membership_tier, points
from `members` as m join `membership` as mem on m.membership = mem.id;


create or replace function truncate_if_exists(tablename text)
returns void language plpgsql as $$
begin
    perform 1
    from information_schema.tables 
    where table_name = tablename;
    if found then
        execute format('truncate %I', tablename);
    end if;
end $$;

select truncate_if_exists('academicdegrees');
select truncate_if_exists('academies');
select truncate_if_exists('competence');
select truncate_if_exists('competencedegreelinks');
select truncate_if_exists('fieldofstudies');
select truncate_if_exists('nqfs');
select truncate_if_exists('organizationeducations');
select truncate_if_exists('organizations');
select truncate_if_exists('schools');

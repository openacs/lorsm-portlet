-- /lorsm-portlet/sql/postgresql/lorsm-portlet-drop.sql
--
-- Removes LORS Management portlet
--
-- @author Nima Mazloumi (mazloumi@uni-mannheim.de)
-- @creation-date 6 Jan 2004
--
--  Copyright (C) 2004 Nima Mazloumi

create function inline_0 ()
returns integer as '
declare
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
    from portal_datasources
    where name = ''lorsm_portlet'';

    if not found then
        raise notice ''No datasource_id found here '', ds_id ;
        ds_id := null;
    end if;

  if ds_id is NOT null then
    perform portal_datasource__delete(ds_id);
    
    delete from portal_datasource_def_params where datasource_id = ds_id;
    
  end if;

return 0;

end;' language 'plpgsql';

select inline_0 ();

drop function inline_0 ();


-- drop the implementation
select acs_sc_impl__delete (
	'portal_datasource',		-- impl_contract_name
	'lorsm_portlet'			-- impl_name
);


-- remove all the hooks
select acs_sc_impl_alias__delete (
              'portal_datasource',	-- impl_contract_name	
              'lorsm_portlet',		-- impl_name
              'GetMyName'		-- impl_operation_name
);

select acs_sc_impl_alias__delete (
              'portal_datasource',	-- impl_contract_name	
              'lorsm_portlet',		-- impl_name
              'GetPrettyName'		-- impl_operation_name
);

select acs_sc_impl_alias__delete (
              'portal_datasource',	-- impl_contract_name	
              'lorsm_portlet',		-- impl_name
              'Link'			-- impl_operation_name
);

select acs_sc_impl_alias__delete (
              'portal_datasource',	-- impl_contract_name	
              'lorsm_portlet',		-- impl_name
              'AddSelfToPage'		-- impl_operation_name
);

select acs_sc_impl_alias__delete (
              'portal_datasource',	-- impl_contract_name	
              'lorsm_portlet',		-- impl_name
              'Show'			-- impl_operation_name
);

select acs_sc_impl_alias__delete (
              'portal_datasource',	-- impl_contract_name	
              'lorsm_portlet',		-- impl_name
              'Edit'			-- impl_operation_name
);

select acs_sc_impl_alias__delete (
              'portal_datasource',	-- impl_contract_name	
              'lorsm_portlet',		-- impl_name
              'RemoveSelfFromPage'	-- impl_operation_name
);

    -- Add the binding
select acs_sc_binding__delete (
        'portal_datasource',
        'lorsm_portlet'
);

\i lorsm-admin-portlet-drop.sql

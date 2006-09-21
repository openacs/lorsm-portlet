-- packages/lorsm-portlet/sql/oracle/lorsm-portlet-create.sql
--
-- Creates LORS Management portlet
--
-- @author Ernie Ghiglione (ErnieG@mm.st)
-- Adapted for Oracle by Mario Aguado <maguado@innova.uned.es>
-- @author Mario Aguado <maguado@innova.uned.es>
-- @creation-date 20/09/2006
-- @cvs-id $Id$
--

declare
  ds_id 	portal_datasources.datasource_id%TYPE;
begin
	ds_id := portal_datasource.new(
			name => 'lorsm_portlet',
			description => 'Displays a Folder_id'
	);


	portal_datasource.set_def_param(
		datasource_id => ds_id,
		config_required_p => 't',
	        configured_p =>  't',
		key => 'shadeable_p',
		value => 't'
	);

	portal_datasource.set_def_param (
		datasource_id => ds_id,
		config_required_p => 't',
	        configured_p =>  't',
		key => 'hideable_p',
		value => 't'
	);

	portal_datasource.set_def_param (
		datasource_id => ds_id,
		config_required_p => 't',
	        configured_p =>  't',
		key => 'user_editable_p',
		value => 'f'
	);

	portal_datasource.set_def_param (
		datasource_id => ds_id,
		config_required_p => 't',
	        configured_p =>  't',
		key => 'shaded_p',
		value => 'f'
	);

	portal_datasource.set_def_param (
		datasource_id => ds_id,
		config_required_p => 't',
	        configured_p =>  't',
		key => 'link_hideable_p',
		value => 't'
	);

	portal_datasource.set_def_param (
		datasource_id => ds_id,
		config_required_p => 't',
	        configured_p =>  't',
		key => 'style',
		value => 'list'
	);

	portal_datasource.set_def_param (
		datasource_id => ds_id,
		config_required_p => 't',
	        configured_p =>  'f',
		key => 'package_id',
		value => ' '
	);

end; 
/
show errors;

declare 
	foo integer;
begin
-- create the implementation
	foo := acs_sc_impl.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_pretty_name => 'lorsm_portlet',
			impl_owner_name	=> 'lorsm_portlet'
		);


-- add all the hooks
	foo := 	acs_sc_impl_alias.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_operation_name => 'GetMyName',
			impl_alias => 'lorsm_portlet::get_my_name',
			impl_pl	=> 'TCL'
		);

	foo := acs_sc_impl_alias.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_operation_name => 'GetPrettyName',
			impl_alias => 'lorsm_portlet::get_pretty_name',
			impl_pl	=> 'TCL'
		);

	foo :=  acs_sc_impl_alias.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_operation_name => 'Link',
			impl_alias => 'lorsm_portlet::link',
			impl_pl	=> 'TCL'
		);

	foo := acs_sc_impl_alias.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_operation_name => 'AddSelfToPage',
			impl_alias => 'lorsm_portlet::add_self_to_page',
			impl_pl	=> 'TCL'
		);

	foo :=  acs_sc_impl_alias.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_operation_name => 'Show',
			impl_alias => 'lorsm_portlet::show',
			impl_pl	=> 'TCL'
		);

	foo := acs_sc_impl_alias.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_operation_name => 'Edit',
			impl_alias => 'lorsm_portlet::edit',
			impl_pl	=> 'TCL'
		);
        
        foo := acs_sc_impl_alias.new(
			impl_contract_name => 'portal_datasource',
			impl_name => 'lorsm_portlet',
			impl_operation_name => 'RemoveSelfFromPage',
			impl_alias => 'lorsm_portlet::remove_self_from_page',
			impl_pl	=> 'TCL'
		);

    -- Add the binding
	acs_sc_binding.new (
		contract_name => 'portal_datasource',
		impl_name => 'lorsm_portlet'
	);
end;
/
show errors;

@@ lorsm-admin-portlet-create.sql

ad_page_contract {

    The display logic for the LORS Management admin portlet
    
    @author Ernie Ghiglione (ErnieG@mm.st)
    @creation-date 2004-04-10
    @cvs-id $Id$

} -properties {
    
}

array set config $cf
set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of lorsm for admin purposes"
}        

set package_id [lindex $list_of_package_ids 0]        

set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]

ad_return_template 

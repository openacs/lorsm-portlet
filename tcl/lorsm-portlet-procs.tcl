ad_library {

    Procedures to support the LORS Management portlet.

    @author Ernie Ghiglione (ErnieG@mm.st)
    @creation-date 2004-04-10
    @cvs-id $Id$

}

namespace eval lorsm_portlet {

    ad_proc -private get_my_name {
    } {
        return "lorsm_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "lorsm-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "LORS Management"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
        {-param_action:required}
    } {
        Adds a LORS Mgt PE to the given portal or appends the given
        lorsm_package_id to the params of the lorsm pe already there

        @param portal_id The page to add self to
        @param package_id the id of the lorsm package for this community

        @return element_id The new element's id
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id \
            -pretty_name [get_pretty_name] \
            -force_region [parameter::get_from_package_key \
                               -package_key [my_package_key] \
                               -parameter "lorsm_portlet_force_region"] \
            -param_action $param_action
        ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Removes a lorsm PE from the given page or just the passed
        in lorsm_package_id parameter from the portlet
        (that has other lorsm_package_ids)

        @param portal_id The page to remove self from
        @param package_id
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
    }

    ad_proc -public show {
        cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "lorsm-portlet"
    }

}

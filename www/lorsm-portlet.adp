<if @shaded_p@ false>
<if @one_instance_p@ true>
   <include src="/packages/lorsm/lib/user-lorsm" package_id="@list_of_package_ids@" />
</if>
<else>

<list name="list_of_package_ids">
.
</list>

</else>

</if>
<else>
  &nbsp;
</else>

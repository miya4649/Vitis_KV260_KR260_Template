set platform_name {project_1_pf}
set app_name {project_1_app}
set domain_name {standalone_psu_cortexa53_0}
set xsa_path {project_1/design_1_wrapper.xsa}
set vitis_src_path {vitis_src}
set vitis_workspace {vitis_classic_workspace}
set template_name {Hello World}
set use_template {yes}

if { $use_template eq "no" } {
    set template_domain {empty_application}
    set template_app {Empty Application(C)}
} else {
    set template_domain $template_name
    set template_app $template_name
}

file mkdir $vitis_workspace
setws $vitis_workspace
platform create -name $platform_name -hw $xsa_path -no-boot-bsp
platform write
domain create -name $domain_name -os {standalone} -proc {psu_cortexa53_0} -arch {64-bit} -support-app $template_domain
platform generate -domains 
platform active $platform_name
platform generate -quick
app create -name $app_name -platform $platform_name -domain $domain_name -template $template_app
if { $use_template eq "no" } {
    importsources -name $app_name -path $vitis_src_path
}
app build -name $app_name

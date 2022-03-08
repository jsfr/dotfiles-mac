(module magic.plugin.neorg
  {autoload {neorg neorg}})

(neorg.setup {:load {:core.defaults {}
                     :core.norg.dirman {:config {:workspaces {:work "~/Notes/work"
                                                              :home "~/Notes/home"}}}}})

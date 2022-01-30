list = [
  {
    :id => :gryffondor,
    :name => "Maison Gryffondor",
    :description => "Description maison gryffondor",
    :is_first_room => true,
    :is_last_room => false,
    :moves => {
      :forward => :pouffsouffle,
      :right => :agrid,
    },
  },
  {
    :id => :pouffsouffle,
    :name => "Maison pouffsouffle",
    :description => "Description maison pouffsouffle",
    :is_first_room => false,
    :is_last_room => true,
    :moves => {
      :forward => :serpentard,
    },
  },
  {
    :id => :serpentard,
    :name => "Maison serpentard",
    :description => "Description maison serpentard",
    :is_first_room => false,
    :is_last_room => false,
    :moves => {
      :forward => :final,
    },
  },
  {
    :id => :final,
    :name => "Final",
    :description => "Description maison Final",
    :is_first_room => false,
    :is_last_room => true,
    :moves => {
      :back => :serpentard
    },
  },
  {
    :id => :agrid,
    :name => "Agrid",
    :description => "Description maison Agrid",
    :is_first_room => false,
    :is_last_room => false,
    :moves => {
      :left => :poufssoufle,
      :back => :gryffondor,
    },
  }
]
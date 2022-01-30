module Rooms
  def self.fetch_rooms_definition
    [
      {
        :id => :a,
        :name => "A",
        :description => "A",
        :first_room => true,
        :last_room => false,
        :moves => {
          :forward => :b
        }
      },
      {
        :id => :b,
        :name => "B",
        :description => "B",
        :first_room => false,
        :last_room => false,
        :moves => {
          :forward => :f,
          :left => :d,
        }
      },
      {
        :id => :c,
        :name => "C",
        :description => "C",
        :first_room => false,
        :last_room => false,
        :moves => {
          :right => :d,
          :forward => :e,
          :back => :e,
        }
      },
      {
        :id => :d,
        :name => "D",
        :description => "D",
        :first_room => false,
        :last_room => false,
        :moves => {
          :right => :b,
          :left => :c,
        }
      },
      {
        :id => :e,
        :name => "E",
        :description => "E",
        :first_room => false,
        :last_room => false,
        :moves => {
          :right => :g,
          :forward => :c,
          :back => :c,
        }
      },
      {
        :id => :f,
        :name => "F",
        :description => "F",
        :first_room => false,
        :last_room => false,
        :moves => {
          :left => :g,
          :forward => :b,
        }
      },
      {
        :id => :g,
        :name => "G",
        :description => "G",
        :first_room => false,
        :last_room => false,
        :moves => {
          :right => :f,
          :left => :e,
          :forward => :h,
        }
      },
      {
        :id => :h,
        :name => "H",
        :description => "H",
        :first_room => false,
        :last_room => true,
        :moves => {
          :back => :g,
        }
      },
    ]
  end

  def self.other_config
    [
      {
        :id => :gryffondor,
        :name => "Maison Gryffondor",
        :description => "Description maison gryffondor",
        :first_room => true,
        :last_room => false,
        :moves => {
          :forward => :pouffsouffle,
          :right => :agrid,
        },
      },
      {
        :id => :pouffsouffle,
        :name => "Maison pouffsouffle",
        :description => "Description maison pouffsouffle",
        :first_room => false,
        :last_room => false,
        :moves => {
          :forward => :serpentard,
        },
      },
      {
        :id => :serpentard,
        :name => "Maison serpentard",
        :description => "Description maison serpentard",
        :first_room => false,
        :last_room => false,
        :moves => {
          :forward => :final,
        },
      },
      {
        :id => :final,
        :name => "Final",
        :description => "Description maison Final",
        :first_room => false,
        :last_room => true,
        :moves => {
          :back => :serpentard
        },
      },
      {
        :id => :agrid,
        :name => "Agrid",
        :description => "Description maison Agrid",
        :first_room => false,
        :last_room => false,
        :moves => {
          :left => :poufssoufle,
          :back => :gryffondor,
        },
      }
    ]
  end
end

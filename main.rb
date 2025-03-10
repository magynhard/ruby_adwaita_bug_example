
require 'ostruct'
require 'gtk4'
require 'adwaita'
require 'shellwords'

class SampleApp

  def initialize
    Adwaita.init
    @app = Adwaita::Application.new("com.sample.App", :flags_none)

    @app.signal_connect("activate") do |application|
      SampleApp.show(app: application)
    end
  end

  def self.show(app:)
    @@app = app
    window = Gtk::ApplicationWindow.new(app)
    window.set_application(app)
    window.set_title("Sample App")
    window.set_default_size(550, 300)

    vbox = Gtk::Box.new(:vertical, 10)
    vbox.margin_top = 20
    vbox.margin_bottom = 20
    vbox.margin_start = 20
    vbox.margin_end = 20

    # WORKS
    group = Adwaita::PreferencesGroup.new
    group.title = "Target"

    # WORKS
    action_row = Adwaita::ActionRow.new
    action_row.title = "Select target file"
    action_row.subtitle = "-"
    action_row.activatable = true
    action_row.signal_connect("activated") { puts "ACTION" }

    group.add action_row
    vbox.append(group)

    # CAN NOT FIND AboutDialog or ButtonRow on MS Windows native and WSL Ubuntu 22.04

    # => uninitialized constant Adwaita::AboutDialog
    dialog = Adwaita::AboutDialog.new
    dialog.application_name = "Sample App"
    dialog.developer_name = "Super Developer"
    dialog.version = "1.0.0"
    dialog.license_type = Gtk::License::MIT_X11

    # => uninitialized constant Adwaita::ButtonRow
    button_row = Adwaita::ButtonRow.new

    window.child = vbox
    window.present

    dialog.show
    dialog.present(window)
  end

  def run
    @app.run
  end
end

SampleApp.new.run
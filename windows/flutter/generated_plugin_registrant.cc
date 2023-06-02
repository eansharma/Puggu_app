//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <geolocator_windows/geolocator_windows.h>
#include <rive_common/rive_plugin.h>
#include <smart_auth/smart_auth_plugin.h>
#include <swipe_button_widget/swipe_button_widget_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  GeolocatorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("GeolocatorWindows"));
  RivePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("RivePlugin"));
  SmartAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SmartAuthPlugin"));
  SwipeButtonWidgetPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SwipeButtonWidgetPlugin"));
}

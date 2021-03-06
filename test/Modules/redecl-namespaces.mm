@import redecl_namespaces_left;
@import redecl_namespaces_right;

void test() {
  A::i;
  A::j;
  A::k;  // expected-error {{no member named 'k' in namespace 'A'}}
}

// RUN: rm -rf %t
// RUN: %clang_cc1 -fmodules -x objective-c++ -fmodules-cache-path=%t -emit-module -fmodule-name=redecl_namespaces_left %S/Inputs/module.map
// RUN: %clang_cc1 -fmodules -x objective-c++ -fmodules-cache-path=%t -emit-module -fmodule-name=redecl_namespaces_right %S/Inputs/module.map
// RUN: %clang_cc1 -fmodules -fmodules-cache-path=%t -w %s -verify

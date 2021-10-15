%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  1,
  2,
  3
])
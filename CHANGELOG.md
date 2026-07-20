# Changelog

All notable changes to this project will be documented in this file.

## [1.3.0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.2.3...v1.3.0) (2025-06-20)


### Features

* add option to enable the prometheus node exporter ([#4](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/4)) ([95993bf](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/95993bf2483a62d2de13ccc43f0bd490466f5ece))
* being able to set the Tailscale version ([#40](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/40)) ([8141220](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/81412204e951d393f383395067aee6915a4a08a5))


### Bug Fixes

* **ci:** add missing .releaserc.json ([#7](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/7)) ([cc5c6d0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/cc5c6d0ab0b2417b12c7cf1502f4e7f9014494a9))
* **ci:** missing repo secret ([#5](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/5)) ([5760d03](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/5760d03a15ae92049c0e3335298e6b2b0aa801da))
* **docs:** terraform providers ([#21](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/21)) ([3274e79](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/3274e79da261a02029c6fb85223fe43ec153e517))
* **ec2:** merge local tags with variable ([#36](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/36)) ([59a58fe](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/59a58fe4cb0b8c7b9cf606bb84b47c3a9c56e55d))
* generate appropriate docs ([#14](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/14)) ([84cd94e](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/84cd94ec11ae99a09788eba062cf16cb15a4ab88))
* release action ([#3](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/3)) ([dfd7fe0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/dfd7fe0c6b45936e0e1add269ede2231fdf063c4))
* **release-please:** trying to trigger v1.0.6 ([#33](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/33)) ([18b7f8e](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/18b7f8e0596a7bf7b0168f2c3d1cb85ebd127932))
* routing issue with latest kernels ([#42](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/42)) ([8c64b12](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/8c64b125e150e582c66b479902066b911c3dc0dc))
* routing issue workaround needs a restart ([#44](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/44)) ([2a739fa](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/2a739fa2c804bb31e638232a4b924e0ad8882d9d))
* set the auth_key as sensitive ([#11](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/11)) ([be2b77c](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/be2b77c0920f9e62d35017b74cbde01cc66de277))
* **tailscale:** systemctl commands ([#10](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/10)) ([bb2d6df](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/bb2d6dfa8636069af746cbb3e6344729baaa6a46))
* upgrade aws provider v6 ([#49](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/49)) ([66521aa](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/66521aaff09b117be63cef889f0f5ff0fe47ae64))
* **vars:** boolean options for prom_exporter and ssm ([#9](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/9)) ([68b5345](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/68b5345c2e18ce1f4a3611185d849407aac45d3a))

## [1.2.3](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.2.2...v1.2.3) (2025-06-20)


### Bug Fixes

* upgrade aws provider v6 ([#49](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/49)) ([66521aa](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/66521aaff09b117be63cef889f0f5ff0fe47ae64))

## [1.2.2](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.2.1...v1.2.2) (2025-03-30)


### Bug Fixes

* routing issue workaround needs a restart ([#44](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/44)) ([2a739fa](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/2a739fa2c804bb31e638232a4b924e0ad8882d9d))

## [1.2.1](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.2.0...v1.2.1) (2025-03-30)


### Bug Fixes

* routing issue with latest kernels ([#42](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/42)) ([8c64b12](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/8c64b125e150e582c66b479902066b911c3dc0dc))

## [1.2.0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.1.0...v1.2.0) (2025-03-28)


### Features

* being able to set the Tailscale version ([#40](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/40)) ([8141220](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/81412204e951d393f383395067aee6915a4a08a5))

## [1.1.0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.0.6...v1.1.0) (2024-09-01)


### Features

* add option to enable the prometheus node exporter ([#4](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/4)) ([95993bf](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/95993bf2483a62d2de13ccc43f0bd490466f5ece))


### Bug Fixes

* **ci:** add missing .releaserc.json ([#7](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/7)) ([cc5c6d0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/cc5c6d0ab0b2417b12c7cf1502f4e7f9014494a9))
* **ci:** missing repo secret ([#5](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/5)) ([5760d03](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/5760d03a15ae92049c0e3335298e6b2b0aa801da))
* **docs:** terraform providers ([#21](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/21)) ([3274e79](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/3274e79da261a02029c6fb85223fe43ec153e517))
* **ec2:** merge local tags with variable ([#36](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/36)) ([59a58fe](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/59a58fe4cb0b8c7b9cf606bb84b47c3a9c56e55d))
* generate appropriate docs ([#14](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/14)) ([84cd94e](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/84cd94ec11ae99a09788eba062cf16cb15a4ab88))
* release action ([#3](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/3)) ([dfd7fe0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/dfd7fe0c6b45936e0e1add269ede2231fdf063c4))
* **release-please:** trying to trigger v1.0.6 ([#33](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/33)) ([18b7f8e](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/18b7f8e0596a7bf7b0168f2c3d1cb85ebd127932))
* set the auth_key as sensitive ([#11](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/11)) ([be2b77c](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/be2b77c0920f9e62d35017b74cbde01cc66de277))
* **tailscale:** systemctl commands ([#10](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/10)) ([bb2d6df](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/bb2d6dfa8636069af746cbb3e6344729baaa6a46))
* **vars:** boolean options for prom_exporter and ssm ([#9](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/9)) ([68b5345](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/68b5345c2e18ce1f4a3611185d849407aac45d3a))

## [1.0.6](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.0.5...v1.0.6) (2024-09-01)


### Bug Fixes

* **release-please:** trying to trigger v1.0.6 ([#33](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/33)) ([18b7f8e](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/18b7f8e0596a7bf7b0168f2c3d1cb85ebd127932))

### [1.0.5](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.0.4...v1.0.5) (2024-05-01)


### Bug Fixes

* **docs:** terraform providers ([#21](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/21)) ([3274e79](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/3274e79da261a02029c6fb85223fe43ec153e517))

### [1.0.4](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.0.3...v1.0.4) (2023-10-11)


### Bug Fixes

* generate appropriate docs ([#14](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/14)) ([84cd94e](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/84cd94ec11ae99a09788eba062cf16cb15a4ab88))

### [1.0.3](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.0.2...v1.0.3) (2023-10-09)


### Bug Fixes

* set the auth_key as sensitive ([#11](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/11)) ([be2b77c](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/be2b77c0920f9e62d35017b74cbde01cc66de277))

### [1.0.2](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.0.1...v1.0.2) (2023-10-06)


### Bug Fixes

* **tailscale:** systemctl commands ([#10](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/10)) ([bb2d6df](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/bb2d6dfa8636069af746cbb3e6344729baaa6a46))

### [1.0.1](https://github.com/Smana/terraform-aws-tailscale-subnet-router/compare/v1.0.0...v1.0.1) (2023-10-06)


### Bug Fixes

* **vars:** boolean options for prom_exporter and ssm ([#9](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/9)) ([68b5345](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/68b5345c2e18ce1f4a3611185d849407aac45d3a))

## 1.0.0 (2023-10-06)


### Features

* add option to enable the prometheus node exporter ([#4](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/4)) ([95993bf](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/95993bf2483a62d2de13ccc43f0bd490466f5ece))


### Bug Fixes

* release action ([#3](https://github.com/Smana/terraform-aws-tailscale-subnet-router/issues/3)) ([dfd7fe0](https://github.com/Smana/terraform-aws-tailscale-subnet-router/commit/dfd7fe0c6b45936e0e1add269ede2231fdf063c4))

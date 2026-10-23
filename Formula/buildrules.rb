class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.30/buildrules-cli-0.0.30-macos-arm64.tar.gz"
      sha256 "e1ed1e775de790a3765ba1ca09edeab358ae3bb707613feaff5b69ceb88e0c97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.30/buildrules-cli-0.0.30-linux-aarch64.tar.gz"
      sha256 "779215adfc809f8d3e5b35d3d4e38df182a9c9cd1199f0ded7c963ff61bab929"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.30/buildrules-cli-0.0.30-linux-x86_64.tar.gz"
      sha256 "41c04c738b5f146911b82a751c1d150d0305df8cb78b4a1a524eebfd11509046"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end

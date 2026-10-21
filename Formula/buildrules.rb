class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.16/buildrules-cli-0.0.16-macos-arm64.tar.gz"
      sha256 "952bd33bbdb8fba1331f4790c90e04f6c3cbf10685df516b3dcc2633c65cda73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.16/buildrules-cli-0.0.16-linux-aarch64.tar.gz"
      sha256 "50a87c4d0277cc93d7f5bb1848c896436a246de6e1678e504b9fad4b23938e6c"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.16/buildrules-cli-0.0.16-linux-x86_64.tar.gz"
      sha256 "f6d887df8b075938003feba488fc0dfc3d136b6180a74a5d029d2c8ba6fd80a3"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end

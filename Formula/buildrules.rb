class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.83/buildrules-cli-0.0.83-macos-arm64.tar.gz"
      sha256 "e69f0b0f78b4a96afe1a41fb34679e9ba435e5c6d96dfa4cad57cfd2e5582465"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.83/buildrules-cli-0.0.83-linux-aarch64.tar.gz"
      sha256 "f8d2c5a589df9b9f5922603616abd93d9f804bd20b0e020a22333d3ccf024558"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.83/buildrules-cli-0.0.83-linux-x86_64.tar.gz"
      sha256 "3ac55513559673d2517394276060a2a2394527f5e4a7849b732c23612069686e"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end

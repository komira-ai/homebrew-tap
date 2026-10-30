class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.69/buildrules-cli-0.0.69-macos-arm64.tar.gz"
      sha256 "c8cab8f24ac6735fd18f8b6019df0d4d6bafa5964348ba989a53b9e90baf1e3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.69/buildrules-cli-0.0.69-linux-aarch64.tar.gz"
      sha256 "8e1d17dd40c8f0f35438162cc11e2ce72334446b21afaa383c6fe7a35192f4fa"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.69/buildrules-cli-0.0.69-linux-x86_64.tar.gz"
      sha256 "e71651783035ff4da38c0945d110e65ae3641ffada83bf93b393c41666aa1b9c"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end

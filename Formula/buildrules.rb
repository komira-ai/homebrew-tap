class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.25/buildrules-cli-0.0.25-macos-arm64.tar.gz"
      sha256 "98153a028c672bac22752daec27c901a08df0134219afd3d2b691479a8d24342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.25/buildrules-cli-0.0.25-linux-aarch64.tar.gz"
      sha256 "550ddac499594158217260108e8b54dd45919d5fa9200b88b7e2a6d9074854b7"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.25/buildrules-cli-0.0.25-linux-x86_64.tar.gz"
      sha256 "2794381d28d7b67675ed4301470b3aa1415011307f845f70395102ea496878e0"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end

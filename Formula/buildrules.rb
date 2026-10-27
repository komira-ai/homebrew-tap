class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.57/buildrules-cli-0.0.57-macos-arm64.tar.gz"
      sha256 "54716481d122fccfafb13bc50ddd86c6a97b962dcad21833e6f4ebfd68de8a8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.57/buildrules-cli-0.0.57-linux-aarch64.tar.gz"
      sha256 "4f9f09e1d59f74020ba838bf5aed6254ceb37ab489ccae78c84e5bd0fbb57ccb"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.57/buildrules-cli-0.0.57-linux-x86_64.tar.gz"
      sha256 "d37346dcc64ea3738c117f06ec8fb21e5e81159e1a8e5a0a83f19dea010b4c79"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end

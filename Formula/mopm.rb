class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.62/mopm-0.0.62-macos-arm64.tar.gz"
      sha256 "21d446aa76879189c4d101c8b5039c491c131bf3dcaace996e645e8c0987addc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.62/mopm-0.0.62-linux-aarch64.tar.gz"
      sha256 "4419044390814a171f763eda9b27b2e88c82e079795f9b9ff5422530eed8c667"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.62/mopm-0.0.62-linux-x86_64.tar.gz"
      sha256 "9301df5cd8871036f1e39c714c26aefcb21fe63417af512a5a04a361df121f10"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end

class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.113/mopm-0.0.113-macos-arm64.tar.gz"
      sha256 "039cb4b6b24617dfcd2d9afae9441877a1a5397887120563703dd34212fe9f22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.113/mopm-0.0.113-linux-aarch64.tar.gz"
      sha256 "b924fd6c69e11102b8c58c4a9c4579f73e0374d1cd1168cc1f058db43c2a40cf"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.113/mopm-0.0.113-linux-x86_64.tar.gz"
      sha256 "4b0e054900f7efe92b9413d328f9a343a599d149a92fdbec7426aa833e359718"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end

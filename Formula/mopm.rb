class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.74/mopm-0.0.74-macos-arm64.tar.gz"
      sha256 "46252a6bd699e531ae897ea2d83a0212cd072d968644ebc5b83b60604841e450"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.74/mopm-0.0.74-linux-aarch64.tar.gz"
      sha256 "222d0dd062963474540e234cccfc5b3442c8c88769ad0cada53ebd1a1ef6f777"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.74/mopm-0.0.74-linux-x86_64.tar.gz"
      sha256 "1026b3516fb199a8c3a0548f1b81b726423da1f87704855009b009383e0aa14e"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
